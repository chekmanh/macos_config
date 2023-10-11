import math
from math import sqrt
import os
import atexit
import readline
readline_history_file = os.path.join(os.path.expanduser('~'), '.cache/python/python_history')
try:
    readline.read_history_file(readline_history_file)
except IOError:
    pass
atexit.register(readline.write_history_file, readline_history_file)
