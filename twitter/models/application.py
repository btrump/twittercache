from __future__ import print_function
from django.db import models
from datetime import datetime
import pytz, logging

class Application(models.Model):
  name = models.CharField(max_length=100)
  url = models.URLField()
  rate_limit_window = models.IntegerField(blank=False)
  rate_limit_requests = models.IntegerField(blank=False)
  results_per_request = models.IntegerField(default=100, blank=False)
  consumer_key = models.CharField(max_length=100)
  consumer_secret = models.CharField(max_length=100)
  request_token_url = models.URLField()
  authorize_url = models.URLField()
  access_token_url = models.URLField()
  callback_url = models.URLField(blank=True)
  access_token = models.CharField(max_length=100, blank=True)
  access_token_secret = models.CharField(max_length=100, blank=True)
  added_at = models.DateTimeField(null=False, blank=False, default=datetime.now(pytz.utc), editable=False)
  
  logger = logging.getLogger(__name__)
  
  class Meta:
    app_label = "twitter"
  
  def __unicode__(self):
    return self.name
  
  def __init__(self, *args, **kwargs):
    super(Application, self).__init__(*args, **kwargs)
    self.configure_logging(args, kwargs)
    
  def configure_logging(self, *args, **kwargs):
    from django.conf import settings
    import os

    log_filename = os.path.join(settings.PROJECT_PATH, 'logs', 'application.log')
    handler = logging.FileHandler(log_filename)
    formatter = logging.Formatter('[%(asctime)s] %(levelname)s - %(funcName)s() - %(message)s')
    handler.setFormatter(formatter)
    handler.setLevel(logging.DEBUG)
    self.logger.addHandler(handler)
    
  def tweets_count(self):
    return self.tweet_set.all().__len__()
  
  def recent_tweets(self, count=10):
    return self.tweet_set.order_by('-created_at')[:count]
  
  def search_terms(self):
    terms = []
    for term in self.searchterm_set.all():
      terms.append(term.term)
      
    return ', '.join(terms)
  
  def get_search_weights_sum(self):
    sum = 0
    for term in self.searchterm_set.all():
      sum += term.weight
    return int(sum)
      
  def get_search_term_count(self):
    return self.searchterm_set.all().count()
  
  def search_all_terms(self):
    self.logger.debug('Searching all terms (%s): %s' % (self.searchterm_set.count(), self.search_terms()))

    response = []
    for term in self.searchterm_set.all():
      term_requests = int((term.weight / float(self.get_search_weights_sum())) * self.rate_limit_requests)
      self.logger.debug('Giving %s a total of %s requests ((%s weight / %s weight sum) * %s rate limit)' % (term, term_requests, term.weight, self.get_search_weights_sum(), self.rate_limit_requests))
      for i in range(term_requests):
        response.append(self.search_term(term))
    return response
  
  def search_term(self, term):
    from twitter.models import Tweet
    import json

    try:
      search_params={'q':term, 'count':self.results_per_request}
      self.logger.debug('Searching with parameters %s' % search_params)
      search_service_path = "search/tweets.json"
      session = self.get_session()
      response = session.get(search_service_path, params=search_params).json()
      statuses = response['statuses']
      self.logger.debug('Got %s results' % statuses.__len__())
      term.increment_search_counter()
      self.store_payload(response)
  
      for result in statuses:
        tweet = Tweet.create(result, term)
        tweet.user.save()
        try:
          tweet.save()
        except Exception as e:
          logged_tweet_path = tweet.log()
          self.logger.error("Could not save tweet with id %s to database.  %s.  JSON response logged to %s" % (tweet.id, e, logged_tweet_path))
      return statuses
    except Exception as e:
      self.logger.error(e)

  def get_session(self):
    from rauth import OAuth1Service

    self.logger.debug('Establishing session with Twitter')

    try:
      base_url = "https://api.twitter.com/1.1/"
      service = OAuth1Service(name='twitter',
                              consumer_key=self.consumer_key,
                              consumer_secret=self.consumer_secret,
                              request_token_url=self.request_token_url,
                              access_token_url=self.access_token_url,
                              authorize_url=self.authorize_url,
                              base_url=base_url)
      session = service.get_session((self.access_token, self.access_token_secret))
      self.logger.debug('Success')
      return session
    except Exception as e:
      self.logger.error("Could not establish session. %s" % e)
      return None
  
  @classmethod
  def store_payload(cls, payload):
    from datetime import datetime
    import os, errno
    
    now = datetime.now()
    log_path = "./twittercache/logs/payloads/%s/" % now.strftime('%Y/%m/%d') 
    filename = now.strftime('%H%M%S.%f.json')
    try:
      os.makedirs(log_path)
    except OSError as e:
      if e.errno is errno.EEXIST and os.path.isdir(log_path):
        pass
      else:
        raise
    with open(log_path + filename, 'w') as f:
      print(payload, file=f)
    f.close