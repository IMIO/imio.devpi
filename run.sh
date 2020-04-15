#!/bin/bash
set -e
set -x

initialize=yes
if [ ! -f "$DEVPISERVER_SERVERDIR/.serverversion" ]; then
    initialize=no
fi

if [[ "$initialize" = "no" ]]; then
    if [ -f "$DEVPISERVER_SERVERDIR/export/dataindex.json" ]; then
        /srv/devpi/import.sh
    else
        /srv/devpi/bin/devpi-init
        /srv/devpi/bin/devpi index root/pypi mirror_use_external_urls=true
    fi
fi

outsideurl="https://${HOSTNAME}"
if [[ "$HOSTNAME" = "localhost:3141" ]]; then
    outsideurl="http://${HOSTNAME}"
fi
/srv/devpi/bin/devpi-server --start --host 0.0.0.0 --port 3141 --outside-url "${outsideurl}"

tail -f "$DEVPISERVER_SERVERDIR/.xproc/devpi-server/xprocess.log"
