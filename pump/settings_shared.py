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

MIDDLEWARE_CLASSES += [  # noqa
    'django.middleware.csrf.CsrfViewMiddleware'
]

MIDDLEWARE = [
    'debug_toolbar.middleware.DebugToolbarMiddleware'
]

INSTALLED_APPS += [  # noqa
    'bootstrap3',
    'bootstrapform',
    'infranil',
    'django_extensions',
    'pump.main',
#    'bdd_tests',
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
