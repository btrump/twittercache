# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Tweet.application'
        db.add_column(u'twitter_tweet', 'application',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=1, to=orm['twitter.Application']),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Tweet.application'
        db.delete_column(u'twitter_tweet', 'application_id')


    models = {
        'twitter.application': {
            'Meta': {'object_name': 'Application'},
            'access_token': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'access_token_secret': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'access_token_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'authorize_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'callback_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'consumer_key': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'consumer_secret': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'rate_limit_requests': ('django.db.models.fields.IntegerField', [], {}),
            'rate_limit_window': ('django.db.models.fields.IntegerField', [], {}),
            'request_token_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'results_per_request': ('django.db.models.fields.IntegerField', [], {'default': '100'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        },
        'twitter.searchterm': {
            'Meta': {'object_name': 'SearchTerm'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 31, 0, 0)'}),
            'application': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.Application']", 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'term': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'weight': ('django.db.models.fields.IntegerField', [], {'default': '1'})
        },
        'twitter.tweet': {
            'Meta': {'object_name': 'Tweet'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 31, 0, 0)'}),
            'application': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.Application']"}),
            'coordinate_latitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'coordinate_longitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'coordinate_type': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {}),
            'favorited': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'in_reply_to_screen_name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'in_reply_to_status_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True'}),
            'in_reply_to_status_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'in_reply_to_user_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True'}),
            'in_reply_to_user_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'retweet_count': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'retweeted': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'search_term': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.SearchTerm']"}),
            'source': ('django.db.models.fields.CharField', [], {'max_length': '400'}),
            'text': ('django.db.models.fields.TextField', [], {}),
            'truncated': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.User']"})
        },
        'twitter.user': {
            'Meta': {'object_name': 'User'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 31, 0, 0)'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'default_profile': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'default_profile_image': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'favourites_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'followers_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'friends_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'geo_enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'is_translator': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lang': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True'}),
            'listed_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'location': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_background_color': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_background_image_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True'}),
            'profile_background_image_url_https': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True'}),
            'profile_background_tile': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'profile_image_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True'}),
            'profile_image_url_https': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True'}),
            'profile_link_color': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_sidebar_border_color': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_sidebar_fill_color': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_text_color': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'profile_use_background_image': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'protected': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'screen_name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'statuses_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'time_zone': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True'}),
            'utc_offset': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'verified': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        }
    }

    complete_apps = ['twitter']