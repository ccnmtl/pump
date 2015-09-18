# flake8: noqa
from settings_shared import *
from ccnmtlsettings.staging import common
import os

project = 'pump'
base = os.path.dirname(__file__)

locals().update(
    common(
        project=project,
        base=base,
        STATIC_ROOT=STATIC_ROOT,
        INSTALLED_APPS=INSTALLED_APPS,
        cloudfront="dp909d54wadkp",
    ))

try:
    from local_settings import *
except ImportError:
    pass
