#!/usr/bin/env python
import json
import os
import requests

#if not os.path.exists('.git'):
 #   raise ValueError('%s/.git NOT EXISTS' % os.getcwd())

LOGIN = os.popen('git config user.name').read().strip()
NAME = os.getcwd().split('/')[-1]
FULLNAME = '%s/%s' % (LOGIN,NAME)
URL = 'https://api.github.com/repos/%s' % FULLNAME
HOMEPAGE = None
if os.path.exists('.github-metadata/homepage.txt'):
    HOMEPAGE = open('.github-metadata/homepage.txt').read().strip()
headers = {
    "Authorization": "Bearer %s" % os.getenv("GITHUB_TOKEN"),
}

r = requests.get(URL,headers=headers)
r.raise_for_status()
if r.json()['homepage']!=HOMEPAGE:
    payload = {'homepage':HOMEPAGE}
    requests.patch(URL,headers=headers,data=json.dumps(payload))
