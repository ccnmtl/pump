# Django settings for pump project.
import os.path
from ccnmtlsettings.shared import common

project = 'pump'
base = os.path.dirname(__file__)

locals().update(common(project=project, base=base))

PROJECT_APPS = [
    'pump.main',
]
USE_TZ = True

MIDDLEWARE_CLASSES += [  # noqa
    'django.middleware.csrf.CsrfViewMiddleware',
]

INSTALLED_APPS += [  # noqa
    'bootstrap3',
    'bootstrapform',
    'infranil',
    'django_extensions',
    'registration',
    'pump.main',
    'bdd_tests',
    'django_behave',
]

ACCOUNT_ACTIVATION_DAYS = 7
