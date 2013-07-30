from django.db import models
from datetime import datetime
import pytz

class User(models.Model):
  CHAR_FIELD_MAX_LENGTH = 200
  
  # Twitter fields
  id = models.BigIntegerField(primary_key=True)
  id_str = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=False, blank=False)
  name = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  screen_name = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  created_at = models.DateTimeField(null=True)
  location = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  is_translator = models.BooleanField()
  favourites_count = models.IntegerField(null=True)
  url = models.URLField(null=True)
  utc_offset = models.IntegerField(null=True)
  listed_count = models.IntegerField(null=True)
  lang = models.CharField(max_length=100, null=True) # 2-6 characters are common, but there is no upper bound defined in the RFC (http://tools.ietf.org/html/bcp47)
  followers_count = models.IntegerField(null=True)
  protected = models.BooleanField()
  verified = models.BooleanField()
  geo_enabled = models.BooleanField()
  time_zone = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  description = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  statuses_count = models.IntegerField(null=True)
  friends_count = models.IntegerField(null=True)
  default_profile = models.BooleanField()
  default_profile_image = models.BooleanField()
  profile_image_url = models.URLField(null=True)
  profile_image_url_https = models.URLField(null=True)
  profile_link_color = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  profile_use_background_image = models.BooleanField()
  profile_text_color = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  profile_background_image_url_https = models.URLField(null=True)
  profile_background_color = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  profile_background_image_url = models.URLField(null=True)
  profile_sidebar_fill_color = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  profile_sidebar_border_color = models.CharField(max_length=CHAR_FIELD_MAX_LENGTH, null=True)
  profile_background_tile = models.BooleanField()
  
  # Custom fields
  added_at = models.DateTimeField(null=False, blank=False, default=datetime.now(pytz.utc))
  
  class Meta:
    app_label = "twitter"
  
  def __unicode__(self):
    return self.name
  
  @classmethod
  def create(cls, result):
    from dateutil import parser
    
    user = User()
    user.id = result["id"]
    user.id_str = result["id_str"]
    user.name = result["name"]
    user.screen_name = result["screen_name"]
    user.created_at = parser.parse(result["created_at"]).strftime('%Y-%m-%d %H:%M:%S%z')
    user.location = result["location"]
    user.is_translator = result["is_translator"]
    user.favourites_count = result["favourites_count"]
    user.url = result["url"]
    user.utc_offset = result["utc_offset"]
    user.listed_count = result["listed_count"]
    user.lang = result["lang"]
    user.followers_count = result["followers_count"]
    user.protected = result["protected"]
    user.verified = result["verified"]
    user.geo_enabled = result["geo_enabled"]
    user.time_zone = result["time_zone"]
    user.description = result["description"]
    user.statuses_count = result["statuses_count"]
    user.friends_count = result["friends_count"]
    user.default_profile = result["default_profile"]
    user.default_profile_image = result["default_profile_image"]
    user.profile_image_url = result["profile_image_url"]
    user.profile_image_url_https = result["profile_image_url_https"]
    user.profile_link_color = result["profile_link_color"]
    user.profile_use_background_image = result["profile_use_background_image"]
    user.profile_text_color = result["profile_text_color"]
    user.profile_background_image_url_https = result["profile_background_image_url_https"]
    user.profile_background_color = result["profile_background_color"]
    user.profile_background_image_url = result["profile_background_image_url"]
    user.profile_sidebar_fill_color = result["profile_sidebar_fill_color"]
    user.profile_sidebar_border_color = result["profile_sidebar_border_color"]
    user.profile_background_tile = result["profile_background_tile"]
    
    return user

