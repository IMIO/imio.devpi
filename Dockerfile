FROM docker-staging.imio.be/base
RUN apt-get update -q && apt-get install -y netbase python3 python3-pip python3-dev python3-venv
RUN useradd -u 1100 -d /srv/devpi devpi
ADD run.sh /srv/devpi/run.sh
RUN mkdir -p /srv/devpi/devpi \
  && chown devpi:devpi -R /srv/devpi/ \
  && chmod +x /srv/devpi/run.sh
ENV DEVPISERVER_SERVERDIR /srv/devpi/devpi \
  DEVPICLIENT_CLIENTDIR /tmp/devpi-client
USER devpi
WORKDIR /srv/devpi
RUN python3 -m venv . \
  && bin/pip install "devpi-server" "devpi-client" "devpi-web" "requests"

VOLUME ["/srv/devpi/devpi"]

EXPOSE 3141
CMD ["/srv/devpi/run.sh"]
