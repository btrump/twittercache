from __future__ import print_function
from django.db import models

class Application(models.Model):
  name = models.CharField(max_length=100)
  url = models.URLField()
  consumer_key = models.CharField(max_length=100)
  consumer_secret = models.CharField(max_length=100)
  request_token_url = models.URLField()
  authorize_url = models.URLField()
  access_token_url = models.URLField()
  callback_url = models.URLField(blank=True)
  access_token = models.CharField(max_length=100, blank=True)
  access_token_secret = models.CharField(max_length=100, blank=True)
  
  class Meta:
    app_label = "twitter"
  
  def __unicode__(self):
    return self.name
  
  def search_terms(self):
    terms = []
    for term in self.searchterm_set.all():
      terms.append(term.term)
      
    return ', '.join(terms)
  
  def search_all_terms(self):
    response = []
    for term in self.searchterm_set.all():
      response.append(self.search_term(term))
    return response

  def search_term(self, term):
    from rauth import OAuth1Service
    from twitter.models import Tweet
    import json

    base_url = "https://api.twitter.com/1.1/"
    search_service_path = "search/tweets.json"
    service = OAuth1Service(name='twitter',
                            consumer_key=self.consumer_key,
                            consumer_secret=self.consumer_secret,
                            request_token_url=self.request_token_url,
                            access_token_url=self.access_token_url,
                            authorize_url=self.authorize_url,
                            base_url=base_url)
    session = service.get_session((self.access_token, self.access_token_secret))
    response = session.get(search_service_path, params={'q':term}).json()
    statuses = response['statuses']
    self.store_payload(statuses)

    for result in statuses:
      tweet = Tweet.create(result, term)
      tweet.user.save()
      try:
        tweet.save()
      except:
        tweet.log()

    return statuses

  @classmethod
  def store_payload(cls, payload):
    from datetime import datetime
    import os, errno
    
    log_path = "./twittercache/payloads/" 
    filename = datetime.now().strftime('%Y%m%d-%H:%M:%S.%f.json')
    try:
      os.makedirs(log_path)
    except OSError as e:
      if e.errno is errno.EEXIST and os.path.isdir(log_path):
        pass
      else:
        raise
    with open(log_path + filename, 'w') as f:
      # f.write(payload)
      print(payload, file=f)
    f.close