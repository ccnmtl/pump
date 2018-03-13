# flake8: noqa
# Django settings for pump project.
import os.path
import sys
from ccnmtlsettings.shared import common

project = 'pump'
base = os.path.dirname(__file__)

locals().update(common(project=project, base=base))

PROJECT_APPS = [
    'pump.main',
]
USE_TZ = True

MIDDLEWARE = MIDDLEWARE_CLASSES
MIDDLEWARE += ['django.middleware.csrf.CsrfViewMiddleware']

INSTALLED_APPS += [
    'bootstrap3',
    'bootstrapform',
    'infranil',
    'django_extensions',
    'pump.main',
    'behave_django',
]

if 'test' in sys.argv or 'jenkins' in sys.argv:
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.sqlite3',
                'NAME': ':memory:',
                'HOST': '',
                'PORT': '',
                'USER': '',
                'PASSWORD': '',
                'ATOMIC_REQUESTS': True,
            }
        }
