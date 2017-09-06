# flake8: noqa
from pump.settings_shared import *

try:
    from local_settings import *
except ImportError:
    pass
