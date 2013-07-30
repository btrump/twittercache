from django.shortcuts import render_to_response
from django.template import RequestContext

def home(request, *args, **kwargs):
  context = RequestContext(request, kwargs)
  return render_to_response('homepage/index.html', context)