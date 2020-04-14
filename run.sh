#!/bin/bash
set -e
set -x

initialize=yes
if [ ! -f "$DEVPISERVER_SERVERDIR/.serverversion" ]; then
    initialize=no
fi

if [[ "$initialize" = "no" ]]; then
    /srv/devpi/bin/devpi-init
fi

/srv/devpi/bin/devpi-server --start --host 0.0.0.0 --port 3141 --outside-url "https://${HOSTNAME}" --indexer-backend=null

tail -f "$DEVPISERVER_SERVERDIR/.xproc/devpi-server/xprocess.log"
