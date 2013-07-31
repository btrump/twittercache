from django.db import models
from datetime import datetime
import pytz
from application import Application

class SearchTerm(models.Model): 
  term = models.CharField(max_length=200)
  application = models.ForeignKey(Application, null=True)
  weight = models.IntegerField(default=1, blank=False)
  search_counter = models.IntegerField(default=0, blank=False)
  active = models.BooleanField(default=False, blank=False)
  added_at = models.DateTimeField(null=False, blank=False, default=datetime.now(pytz.utc))
  
  class Meta:
    app_label = "twitter"

  def __unicode__(self):
    return self.term
  
  def tweets_count(self):
    return self.tweet_set.all().__len__()
  
  def increment_search_counter(self):
    self.search_counter += 1
    self.save()