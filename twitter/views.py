from django.shortcuts import render_to_response
from django.template.loader import render_to_string
from django.template import RequestContext
from django.http import HttpResponse
from twitter.models import Application
from twitter.models import SearchTerm

def perform_search(request, *args, **kwargs):
  import json
  import random

  # for dev just using first application  
  application_id = request.REQUEST['application_id']
  application = Application.objects.get(pk=application_id)
  
#  random_index = random.randint(0, SearchTerm.objects.count() - 1)
#  search_term = SearchTerm.objects.all()[random_index]

  response = application.search_all_terms()
  return HttpResponse(json.dumps(response), mimetype='application/json')