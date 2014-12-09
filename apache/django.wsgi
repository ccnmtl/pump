import os, sys, site

# enable the virtualenv
site.addsitedir('/var/www/pump/pump/ve/lib/python2.7/site-packages')

# paths we might need to pick up the project's settings
sys.path.append('/var/www/pump/pump/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'pump.settings_production'

import django
django.setup()
import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
