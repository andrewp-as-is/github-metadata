#!/usr/bin/env bash
{ set +x; } 2>/dev/null

find -H ~/git -type d -mindepth 1 -maxdepth 1 | while read path; do
    cd "$path" || exit
     ( set -x; cp -R ~/git/github-metadata/repos/"${PWD##*/}"/ .github-metadata )
done
