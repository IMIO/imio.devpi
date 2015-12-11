
docker-image:
	rm -rf devpi
	mkdir devpi
	docker-compose rm devpi
	docker-compose build

go-in:
	docker-compose run --rm --service-ports devpi bash

cleanall:
	rm -rf devpi
	docker-compose rm devpi
