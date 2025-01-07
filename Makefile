build-image:
	docker build . -t ghcr.io/dinhnq-gihot/shoeshop:latest -f ./docker/Dockerfile

run-container:
	docker compose -f ./docker/docker-compose.yml up -d

remove-container:
	docker compose -f ./docker/docker-compose.yml down