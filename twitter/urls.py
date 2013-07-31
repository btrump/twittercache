from django.conf.urls import patterns, include, url
    
urlpatterns = patterns('twitter.views',
                       url(r'^perform_search/$', 'perform_search', {}, 'perform_search'),
                       url(r'^download/tweets/(?P<application_id>\d+)$', 'download_tweets', name='download_tweets' )
                       )