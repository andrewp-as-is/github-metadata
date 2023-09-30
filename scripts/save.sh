#!/usr/bin/env bash
{ set +x; } 2>/dev/null

[[ ${PWD%/*} != */git ]] && echo "ERROR: $PWD" 1>&2 && exit 1

! [ -e .github-metadata ] && echo "SKIP: .pypi-metadata NOT EXISTS" && exit

( set -x; rsync -a .github-metadata/ ~/git/github-metadata/repos/"${PWD##*/}" )
