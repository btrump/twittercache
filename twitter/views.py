from django.shortcuts import render_to_response
from django.template.loader import render_to_string
from django.template import RequestContext
from django.http import HttpResponse
from twitter.models import Application
from twitter.models import SearchTerm

def perform_search(request, *args, **kwargs):
  import json

  application_id = request.REQUEST['application_id']
  application = Application.objects.get(pk=application_id)

  response = application.search_all_terms()
  return HttpResponse(json.dumps(response), mimetype='application/json')

def download_tweets(request, **kwargs):
  """ Send a CSV of email addresses of losers of the specified contest. """
  from datetime import datetime
  import csv, pytz
  
  application = Application.objects.get(pk=kwargs['application_id'])
  response = HttpResponse(mimetype='text/csv')
  filename = "%s_tweets_%s.csv" % (application.name, datetime.now(pytz.utc).strftime("%Y-%m-%d_%H:%M:%S"))
  response['Content-Disposition'] = 'attachment; filename=' + filename
  writer = csv.writer(response)
  for tweet in application.tweet_set.all():
      writer.writerow([tweet.id, tweet.user, tweet.text.encode('ascii', 'ignore')])
  return response
