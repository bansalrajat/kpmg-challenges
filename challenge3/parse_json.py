import pyjq
import json
import sys

if len(sys.argv) != 2:
    print("Usage: {} {}".format(sys.argv[0] , "<you key for object>"))
    exit(1)

key = str(sys.argv[1])

with open('object.json') as obj:
  object = json.load(obj)

def getObject(key,object):
    return pyjq.first(key,object)

print("Key => {} ; Value => {}".format(key , getObject(key,object)))