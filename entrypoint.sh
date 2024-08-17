#!/bin/sh

cd /app && perl envsubst.pl html/index.html.tpl html/index.htm && cd -

exec /docker-entrypoint.sh "$@"
