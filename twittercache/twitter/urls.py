from django.conf.urls import patterns, include, url
    
urlpatterns = patterns('twitter.views',
                       url(r'^perform_search/$', 'perform_search', {}, 'perform_search'),
                       )