# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Application'
        db.create_table(u'twitter_application', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('consumer_key', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('consumer_secret', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('request_token_url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('authorize_url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('access_token_url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('callback_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
        ))
        db.send_create_signal('twitter', ['Application'])

        # Adding model 'User'
        db.create_table(u'twitter_user', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('id_str', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('screen_name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')()),
            ('location', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('is_translator', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('favourites_count', self.gf('django.db.models.fields.IntegerField')()),
            ('url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('utc_offset', self.gf('django.db.models.fields.IntegerField')()),
            ('listed_count', self.gf('django.db.models.fields.IntegerField')()),
            ('lang', self.gf('django.db.models.fields.CharField')(max_length=2)),
            ('followers_count', self.gf('django.db.models.fields.IntegerField')()),
            ('protected', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('verified', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('geo_enabled', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('time_zone', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('statuses_count', self.gf('django.db.models.fields.IntegerField')()),
            ('friends_count', self.gf('django.db.models.fields.IntegerField')()),
            ('default_profile', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('default_profile_image', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('profile_image_url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('profile_image_url_https', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('profile_link_color', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('profile_use_background_image', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('profile_text_color', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('profile_background_image_url_https', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('profile_background_color', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('profile_background_image_url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('profile_sidebar_fill_color', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('profile_sidebar_border_color', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('profile_background_tile', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('added_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2013, 7, 11, 0, 0))),
        ))
        db.send_create_signal('twitter', ['User'])

        # Adding model 'Tweet'
        db.create_table(u'twitter_tweet', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('id_str', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('coordinate_longitude', self.gf('django.db.models.fields.FloatField')(blank=True)),
            ('coordinate_latitude', self.gf('django.db.models.fields.FloatField')(blank=True)),
            ('coordinate_type', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')()),
            ('favorited', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('truncated', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('retweeted', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('text', self.gf('django.db.models.fields.CharField')(max_length=140)),
            ('retweet_count', self.gf('django.db.models.fields.IntegerField')()),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['twitter.User'])),
            ('in_reply_to_user_id', self.gf('django.db.models.fields.BigIntegerField')(null=True)),
            ('in_reply_to_user_id_str', self.gf('django.db.models.fields.CharField')(max_length=200, null=True)),
            ('in_reply_to_status_id', self.gf('django.db.models.fields.BigIntegerField')(null=True)),
            ('in_reply_to_status_id_str', self.gf('django.db.models.fields.CharField')(max_length=200, null=True)),
            ('in_reply_to_screen_name', self.gf('django.db.models.fields.CharField')(max_length=200, null=True)),
            ('source', self.gf('django.db.models.fields.CharField')(max_length=400)),
            ('added_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2013, 7, 11, 0, 0))),
        ))
        db.send_create_signal('twitter', ['Tweet'])


    def backwards(self, orm):
        # Deleting model 'Application'
        db.delete_table(u'twitter_application')

        # Deleting model 'User'
        db.delete_table(u'twitter_user')

        # Deleting model 'Tweet'
        db.delete_table(u'twitter_tweet')


    models = {
        'twitter.application': {
            'Meta': {'object_name': 'Application'},
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
        'twitter.tweet': {
            'Meta': {'object_name': 'Tweet'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 11, 0, 0)'}),
            'coordinate_latitude': ('django.db.models.fields.FloatField', [], {'blank': 'True'}),
            'coordinate_longitude': ('django.db.models.fields.FloatField', [], {'blank': 'True'}),
            'coordinate_type': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {}),
            'favorited': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'in_reply_to_screen_name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'in_reply_to_status_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True'}),
            'in_reply_to_status_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'in_reply_to_user_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True'}),
            'in_reply_to_user_id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'retweet_count': ('django.db.models.fields.IntegerField', [], {}),
            'retweeted': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'source': ('django.db.models.fields.CharField', [], {'max_length': '400'}),
            'text': ('django.db.models.fields.CharField', [], {'max_length': '140'}),
            'truncated': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.User']"})
        },
        'twitter.user': {
            'Meta': {'object_name': 'User'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 11, 0, 0)'}),
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