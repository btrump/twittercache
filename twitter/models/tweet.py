from __future__ import print_function
from django.db import models
from datetime import datetime
import pytz
from twitter.models import *

class TweetManager(models.Manager):
  """ Gets the object or returns none """
  def get_or_none(self, **kwargs):
    try:
      return self.get(**kwargs)
    except (self.model.DoesNotExist, self.model.MultipleObjectsReturned), e:
      return None

class Tweet(models.Model):
  CHAR_FIELD_MAX_LENGTH = 200
  TWEET_TEXT_LENGTH = 400
  
  # Twitter fields
  id = models.BigIntegerField(primary_key=True)
  id_str = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH)
  coordinate_longitude = models.FloatField(blank=True, null=True)
  coordinate_latitude = models.FloatField(blank=True, null=True)
  coordinate_type = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, blank=True, null=True)
  created_at = models.DateTimeField(null=False, blank=False)
  favorited = models.NullBooleanField(null=True, blank=False)
  truncated = models.NullBooleanField(null=False, blank=False)
  retweeted = models.NullBooleanField(null=False, blank=False)
  text = models.TextField()
  retweet_count = models.IntegerField(blank=False, null=False, default=0)
  user = models.ForeignKey(User, null=False)
  in_reply_to_user_id = models.BigIntegerField(null=True)
  in_reply_to_user_id_str = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  in_reply_to_status_id = models.BigIntegerField(null=True)
  in_reply_to_status_id_str = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  in_reply_to_screen_name = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  source = models.CharField(max_length=400)

  # Custom fields
  added_at = models.DateTimeField(null=False, blank=False, default=datetime.now(pytz.utc))
  search_term = models.ForeignKey(SearchTerm, null=False, blank=False)
  application = models.ForeignKey(Application, null=False, blank=False)
  
  # Container for JSON response
  json = ""
  
  # Managers
  objects = TweetManager()
  
  class Meta:
    app_label = "twitter"

  def __unicode__(self):
    return self.text + "\"" + self.text + "\" --" + self.user.name
  
  @classmethod
  def parse_coordinates(cls, coordinates):
    """ Represents the geographic location of this Tweet as reported by the user or client application. The inner coordinates array is formatted as geoJSON (longitude first, then latitude) """
    import json

    try:
      coord = json.loads(coordinates)
      long = coord["coordinates"][0]
      lat = coord["coordinates"][0]
      type = coord["type"]
    except TypeError:
      import os, errno
      
      log_path = "./twittercache/logs/coordinates/" 
      filename = datetime.now().strftime('%Y%m%d-%H:%M:%S.%f.json')
      try:
        os.makedirs(log_path)
      except OSError as e:
        if e.errno is errno.EEXIST and os.path.isdir(log_path):
          pass
        else:
          raise
      with open(log_path + filename, 'w') as f:
        print(coordinates, file=f)
      f.close
      long = lat = type = None
      
    return long, lat, type
  
  @classmethod    
  def create(cls, result, term):
    from dateutil import parser
    
    tweet = Tweet()
    tweet.json = result
    tweet.search_term = term
    tweet.user = User.create(result.pop("user", None))
    tweet.application = term.application
    tweet.id = result["id"]
    tweet.id_str = result["id_str"]
    tweet.coordinate_longitude, tweet.coordinate_latitude, tweet.coordinate_type = Tweet.parse_coordinates(result["coordinates"])
    tweet.created_at = result["created_at"]
    tweet.favorited = result["favorited"]
    tweet.truncated = result["truncated"]
    tweet.retweeted = result["retweeted"]
    # suspect text may come as bytestring
    tweet.text = result["text"].encode('ascii', 'ignore')
    tweet.retweet_count = result["retweet_count"]
    tweet.in_reply_to_user_id = result["in_reply_to_user_id"]
    tweet.in_reply_to_user_id_str = result["in_reply_to_user_id_str"]
    tweet.in_reply_to_status_id = result["in_reply_to_status_id"]
    tweet.in_reply_to_status_id_str = result["in_reply_to_status_id_str"]
    tweet.in_reply_to_screen_name = result["in_reply_to_screen_name"]
    tweet.source = result["source"]
    tweet.created_at = parser.parse(result["created_at"]).strftime('%Y-%m-%d %H:%M:%S%z')
    
    return tweet
  
  def log(self):
    from datetime import datetime
    import os, errno, json
    
    now = datetime.now()
    filename = now.strftime('%H%M%S.%f.json')
    log_path = "./twittercache/logs/tweets/%s/" % now.strftime('%Y/%m/%d') 
    filename = "%s.json" % self.id
    try:
      os.makedirs(log_path)
    except OSError as e:
      if e.errno is errno.EEXIST and os.path.isdir(log_path):
        pass
      else:
        raise
    with open(log_path + filename, 'w') as f:
      print(self.json, file=f)
    f.close
    
    return log_path + filename