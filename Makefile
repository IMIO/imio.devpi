
devpi:
	mkdir -p devpi
	sudo chown 1100:1100 devpi

docker-image:
	docker build --pull --no-cache -t devpi:latest .

go-in:
	docker-compose run --rm --service-ports devpi bash

cleanall:
	sudo rm -rf devpi
	docker-compose down

update-prod-image:
	docker build --pull -t docker-prod.imio.be/devpi:latest .
	docker push docker-prod.imio.be/devpi:latest

up: devpi
	docker-compose up

build:
	docker-compose build

rsync:
	mkdir -p devpi/export
	sudo chown 1000:1000 -R devpi
	rsync -rP devpi:/srv/devpi/export/ devpi/export/
	sudo chown 1100:1100 -R devpi
