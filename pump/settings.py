# flake8: noqa
from pump.settings_shared import *

try:
    from pump.local_settings import *
except ImportError:
    pass
