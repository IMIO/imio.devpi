#!/bin/bash
set -e
set -x

initialize=yes
if [ ! -f "$DEVPI_SERVERDIR/.serverversion" ]; then
    initialize=no
fi

/srv/devpi/bin/devpi-server --start --host 0.0.0.0 --port 3141 --request-timeout 30 --outside-url http://${HOSTNAME}

if [[ "$initialize" = "no" ]]; then
  /srv/devpi/bin/devpi use http://localhost:3141
  /srv/devpi/bin/devpi use root/pypi
  /srv/devpi/bin/devpi login root --password=''
  /srv/devpi/bin/devpi user -m root password="${DEVPI_PASSWORD}"
  /srv/devpi/bin/devpi index -y -c imio pypi_whitelist='*'
fi

tail -f $DEVPI_SERVERDIR/.xproc/devpi-server/xprocess.log
