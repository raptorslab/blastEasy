#!/usr/bin/env python

import os
import sys
import time

opt = sys.argv
cmd = opt[1]
wdir = opt[2]

bg = 10000000000

rid = wdir+'/f%20d'%(time.time()*bg)

if not os.path.isfile(rid):
    f = open(rid+'.cmd', 'w')
    f.write(cmd)
    f.close()
else:
    time.sleep(0.01)

    rid = wdir+'/f%20d'%(time.time()*bg)

    f = open(rid+'.cmd', 'w')
    f.write(cmd)
    f.close()

while not os.path.isfile(rid+'.out'):
    time.sleep(1)

g = open(rid+'.out', 'r')
text = g.read()
g.close()

os.unlink(rid+'.out')

sys.stdout.write(text)
