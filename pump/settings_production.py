# flake8: noqa
from settings_shared import *
from ccnmtlsettings.production import common
import os

project = 'pump'
base = os.path.dirname(__file__)

locals().update(
    common(
        project=project,
        base=base,
        STATIC_ROOT=STATIC_ROOT,
        INSTALLED_APPS=INSTALLED_APPS,
        cloudfront="d1dxl1g40sjqc0",
    ))

try:
    from local_settings import *
except ImportError:
    pass
