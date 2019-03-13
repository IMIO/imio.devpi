#!/bin/bash
set -e
set -x

initialize=yes
if [ ! -f "$DEVPI_SERVERDIR/.serverversion" ]; then
    initialize=no
fi

if [[ "$initialize" = "no" ]]; then
    /srv/devpi/bin/devpi-server --start --host 0.0.0.0 --port 3141 --request-timeout 60 --outside-url http://${HOSTNAME} --init
else
    /srv/devpi/bin/devpi-server --start --host 0.0.0.0 --port 3141 --request-timeout 60 --outside-url http://${HOSTNAME}
fi

tail -f $DEVPI_SERVERDIR/.xproc/devpi-server/xprocess.log
