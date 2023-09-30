#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=
find -H ~/git -type d -mindepth 1 -maxdepth 1 | while read path; do
    [ -e "$path"/.readme ] && ( set -x; mv "$path"/.readme "$path"/.readme-generator )
    #echo cp -R $path/.github ~/git/github-metadata/"$basename"
    #3 ( set -x; cp -R $path/.github ~/git/github-metadata/metadata/"$basename" )
done
