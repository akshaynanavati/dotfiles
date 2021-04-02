#!/usr/bin/python3

import os
import sys
from pathlib import Path

MAX_LEN = 20
if len(sys.argv) > 1:
    MAX_LEN = int(sys.argv[1])

HOME = str(Path.home())

dir = os.getcwd()

s = "/"
if dir.startswith(HOME):
    s = '~/'
    dir = dir[len(HOME) + 1:]
else:
    dir = dir[1:]

if len(dir) > MAX_LEN:
    for p in dir.split('/')[:-1]:
        if not p:
            continue
        for sp in p.split(' '):
            s += sp[0]
        s += '/'
    s += dir.split('/')[-1]
elif dir:
    s += dir

print(s, end='')
