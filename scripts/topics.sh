#!/usr/bin/env bash
{ set +x; } 2>/dev/null

[[ "$PWD" == *django* ]] && echo "django"
[[ "$PWD" == *postgres* ]] && echo "postgres"
[[ "$PWD" == *mac-* ]] && echo "mac"
:

