import os
from django.conf import settings
from pump.settings_shared import *  # noqa: F403
from ccnmtlsettings.staging import common
import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration

project = 'pump'
base = os.path.dirname(__file__)

locals().update(
    common(
        project=project,
        base=base,
        STATIC_ROOT=STATIC_ROOT,  # noqa: F405
        INSTALLED_APPS=INSTALLED_APPS,  # noqa: F405
        cloudfront="d1vy4q2u1y7bpg",
    ))

try:
    from pump.local_settings import *  # noqa: F403
except ImportError:
    pass

if hasattr(settings, 'SENTRY_DSN'):
    sentry_sdk.init(
        dsn=SENTRY_DSN,  # noqa: F405
        integrations=[DjangoIntegration()],
        debug=True,
    )
