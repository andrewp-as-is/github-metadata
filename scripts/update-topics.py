#!/usr/bin/env python
import github
import os

if not os.path.exists('.git'):
    raise ValueError('%s/.git NOT EXISTS' % os.getcwd())

NAME = os.getcwd().split('/')[-1]
FULLNAME = '/'.join(os.getcwd().split('/')[-2])
TOPICS = list(sorted(open('.github-metadata/topics.txt').read().strip().splitlines()))

g = github.Github(os.environ["GITHUB_TOKEN"])
repo = g.get_user().get_repo(NAME)
if repo.get_topics()!=TOPICS:
    print("UPDATE TOPICS: %s" % ','.join(TOPICS))
    repo.replace_topics(TOPICS)
