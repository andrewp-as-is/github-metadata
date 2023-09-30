#!/usr/bin/env bash
{ set +x; } 2>/dev/null

[[ ${PWD%/*} != */git ]] && echo "ERROR: $PWD" 1>&2 && exit 1

! [ -e .github-metadata ] && {
    ( set -x; mkdir .github-metadata ) || exit
}
! [ -f .github-metadata/description.txt ] && {
    ( set -x; touch .github-metadata/description.txt ) || exit
}
( set -x; bash "${BASH_SOURCE[0]%/*}"/topics.sh ) | sort >> .github-metadata/topics.txt
( set -x; sort -u -o .github-metadata/topics.txt{,} )

