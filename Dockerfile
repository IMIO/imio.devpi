FROM docker-staging.imio.be/base
RUN apt-get update -q && apt-get install -y netbase python python-pip python-virtualenv
RUN useradd -u 1000 -d /srv/devpi devpi
ADD run.sh /srv/devpi/run.sh
ENV mkdir -p /srv/devpi/devpi
RUN chown devpi:devpi -R /srv/devpi/ && chmod +x /srv/devpi/run.sh
ENV DEVPI_SERVERDIR /srv/devpi/devpi
USER devpi
WORKDIR /srv/devpi
RUN virtualenv -p python3 .
RUN bin/pip install "devpi-server" "devpi-client" "devpi-web" "requests"

VOLUME ["/srv/devpi/devpi"]

EXPOSE 3141
CMD ["/srv/devpi/run.sh"]