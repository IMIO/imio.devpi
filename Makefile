
docker-compose-image:
	mkdir devpi
	docker-compose -p devpi build

docker-image:
	docker build --no-cache=true -t devpi:latest .

go-in:
	docker-compose run --rm --service-ports devpi bash

cleanall:
	rm -rf devpi
	docker-compose rm devpi
