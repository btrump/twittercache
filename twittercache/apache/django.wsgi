import os
import sys

os.environ['DJANGO_SETTINGS_MODULE'] = 'twittercache.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

path = '/media/www/django/twittercache/'
if path not in sys.path:
  sys.path.append(path)
