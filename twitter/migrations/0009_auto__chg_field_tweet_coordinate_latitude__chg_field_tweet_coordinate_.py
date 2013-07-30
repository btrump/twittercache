# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Tweet.coordinate_latitude'
        db.alter_column(u'twitter_tweet', 'coordinate_latitude', self.gf('django.db.models.fields.FloatField')(null=True))

        # Changing field 'Tweet.coordinate_longitude'
        db.alter_column(u'twitter_tweet', 'coordinate_longitude', self.gf('django.db.models.fields.FloatField')(null=True))

    def backwards(self, orm):

        # Changing field 'Tweet.coordinate_latitude'
        db.alter_column(u'twitter_tweet', 'coordinate_latitude', self.gf('django.db.models.fields.FloatField')(default=''))

        # Changing field 'Tweet.coordinate_longitude'
        db.alter_column(u'twitter_tweet', 'coordinate_longitude', self.gf('django.db.models.fields.FloatField')(default=''))

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
            'request_token_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        },
        'twitter.searchterm': {
            'Meta': {'object_name': 'SearchTerm'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 25, 0, 0)'}),
            'application': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.Application']", 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'term': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'weight': ('django.db.models.fields.IntegerField', [], {'default': '1'})
        },
        'twitter.tweet': {
            'Meta': {'object_name': 'Tweet'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 25, 0, 0)'}),
            'coordinate_latitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'coordinate_longitude': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'coordinate_type': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {}),
            'favorited': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'in_reply_to_screen_name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'in_reply_to_status_id': ('django.db.models.fields.BigIntegerField', [], {'blank': 'True'}),
            'in_reply_to_status_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'in_reply_to_user_id': ('django.db.models.fields.BigIntegerField', [], {'blank': 'True'}),
            'in_reply_to_user_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'retweet_count': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'retweeted': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'search_term': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.SearchTerm']"}),
            'source': ('django.db.models.fields.CharField', [], {'max_length': '400'}),
            'text': ('django.db.models.fields.CharField', [], {'max_length': '140'}),
            'truncated': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.User']"})
        },
        'twitter.user': {
            'Meta': {'object_name': 'User'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 25, 0, 0)'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {}),
            'default_profile': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'default_profile_image': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'favourites_count': ('django.db.models.fields.IntegerField', [], {}),
            'followers_count': ('django.db.models.fields.IntegerField', [], {}),
            'friends_count': ('django.db.models.fields.IntegerField', [], {}),
            'geo_enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'is_translator': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lang': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'listed_count': ('django.db.models.fields.IntegerField', [], {}),
            'location': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_background_color': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_background_image_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'profile_background_image_url_https': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'profile_background_tile': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'profile_image_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'profile_image_url_https': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'profile_link_color': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_sidebar_border_color': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_sidebar_fill_color': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_text_color': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profile_use_background_image': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'protected': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'screen_name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'statuses_count': ('django.db.models.fields.IntegerField', [], {}),
            'time_zone': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'utc_offset': ('django.db.models.fields.IntegerField', [], {}),
            'verified': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        }
    }

    complete_apps = ['twitter']