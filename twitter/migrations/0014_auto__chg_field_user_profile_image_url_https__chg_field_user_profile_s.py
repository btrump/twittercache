# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'User.profile_image_url_https'
        db.alter_column(u'twitter_user', 'profile_image_url_https', self.gf('django.db.models.fields.URLField')(max_length=200, null=True))

        # Changing field 'User.profile_sidebar_fill_color'
        db.alter_column(u'twitter_user', 'profile_sidebar_fill_color', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.profile_text_color'
        db.alter_column(u'twitter_user', 'profile_text_color', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.followers_count'
        db.alter_column(u'twitter_user', 'followers_count', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'User.id_str'
        db.alter_column(u'twitter_user', 'id_str', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.location'
        db.alter_column(u'twitter_user', 'location', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.statuses_count'
        db.alter_column(u'twitter_user', 'statuses_count', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'User.description'
        db.alter_column(u'twitter_user', 'description', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.friends_count'
        db.alter_column(u'twitter_user', 'friends_count', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'User.profile_link_color'
        db.alter_column(u'twitter_user', 'profile_link_color', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.profile_image_url'
        db.alter_column(u'twitter_user', 'profile_image_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True))

        # Changing field 'User.profile_background_color'
        db.alter_column(u'twitter_user', 'profile_background_color', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.profile_background_image_url'
        db.alter_column(u'twitter_user', 'profile_background_image_url', self.gf('django.db.models.fields.URLField')(max_length=200, null=True))

        # Changing field 'User.screen_name'
        db.alter_column(u'twitter_user', 'screen_name', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.lang'
        db.alter_column(u'twitter_user', 'lang', self.gf('django.db.models.fields.CharField')(max_length=2, null=True))

        # Changing field 'User.favourites_count'
        db.alter_column(u'twitter_user', 'favourites_count', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'User.name'
        db.alter_column(u'twitter_user', 'name', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.created_at'
        db.alter_column(u'twitter_user', 'created_at', self.gf('django.db.models.fields.DateTimeField')(null=True))

        # Changing field 'User.profile_background_image_url_https'
        db.alter_column(u'twitter_user', 'profile_background_image_url_https', self.gf('django.db.models.fields.URLField')(max_length=200, null=True))

        # Changing field 'User.time_zone'
        db.alter_column(u'twitter_user', 'time_zone', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.profile_sidebar_border_color'
        db.alter_column(u'twitter_user', 'profile_sidebar_border_color', self.gf('django.db.models.fields.CharField')(max_length=200, null=True))

        # Changing field 'User.listed_count'
        db.alter_column(u'twitter_user', 'listed_count', self.gf('django.db.models.fields.IntegerField')(null=True))

    def backwards(self, orm):

        # Changing field 'User.profile_image_url_https'
        db.alter_column(u'twitter_user', 'profile_image_url_https', self.gf('django.db.models.fields.URLField')(default='', max_length=200))

        # Changing field 'User.profile_sidebar_fill_color'
        db.alter_column(u'twitter_user', 'profile_sidebar_fill_color', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.profile_text_color'
        db.alter_column(u'twitter_user', 'profile_text_color', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.followers_count'
        db.alter_column(u'twitter_user', 'followers_count', self.gf('django.db.models.fields.IntegerField')(default=''))

        # Changing field 'User.id_str'
        db.alter_column(u'twitter_user', 'id_str', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.location'
        db.alter_column(u'twitter_user', 'location', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.statuses_count'
        db.alter_column(u'twitter_user', 'statuses_count', self.gf('django.db.models.fields.IntegerField')(default=''))

        # Changing field 'User.description'
        db.alter_column(u'twitter_user', 'description', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.friends_count'
        db.alter_column(u'twitter_user', 'friends_count', self.gf('django.db.models.fields.IntegerField')(default=''))

        # Changing field 'User.profile_link_color'
        db.alter_column(u'twitter_user', 'profile_link_color', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.profile_image_url'
        db.alter_column(u'twitter_user', 'profile_image_url', self.gf('django.db.models.fields.URLField')(default='', max_length=200))

        # Changing field 'User.profile_background_color'
        db.alter_column(u'twitter_user', 'profile_background_color', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.profile_background_image_url'
        db.alter_column(u'twitter_user', 'profile_background_image_url', self.gf('django.db.models.fields.URLField')(default='', max_length=200))

        # Changing field 'User.screen_name'
        db.alter_column(u'twitter_user', 'screen_name', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.lang'
        db.alter_column(u'twitter_user', 'lang', self.gf('django.db.models.fields.CharField')(default='', max_length=2))

        # Changing field 'User.favourites_count'
        db.alter_column(u'twitter_user', 'favourites_count', self.gf('django.db.models.fields.IntegerField')(default=''))

        # Changing field 'User.name'
        db.alter_column(u'twitter_user', 'name', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.created_at'
        db.alter_column(u'twitter_user', 'created_at', self.gf('django.db.models.fields.DateTimeField')(default=''))

        # Changing field 'User.profile_background_image_url_https'
        db.alter_column(u'twitter_user', 'profile_background_image_url_https', self.gf('django.db.models.fields.URLField')(default='', max_length=200))

        # Changing field 'User.time_zone'
        db.alter_column(u'twitter_user', 'time_zone', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.profile_sidebar_border_color'
        db.alter_column(u'twitter_user', 'profile_sidebar_border_color', self.gf('django.db.models.fields.CharField')(default='', max_length=200))

        # Changing field 'User.listed_count'
        db.alter_column(u'twitter_user', 'listed_count', self.gf('django.db.models.fields.IntegerField')(default=''))

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
            'text': ('django.db.models.fields.CharField', [], {'max_length': '140'}),
            'truncated': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['twitter.User']"})
        },
        'twitter.user': {
            'Meta': {'object_name': 'User'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 7, 25, 0, 0)'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'null': 'True'}),
            'default_profile': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'default_profile_image': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'favourites_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'followers_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'friends_count': ('django.db.models.fields.IntegerField', [], {'null': 'True'}),
            'geo_enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'id_str': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True'}),
            'is_translator': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lang': ('django.db.models.fields.CharField', [], {'max_length': '2', 'null': 'True'}),
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