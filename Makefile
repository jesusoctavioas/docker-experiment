containers = $(shell find . -mindepth 1 -maxdepth 1 -not -path "*/.*" -type d -exec basename {} \;)
volumes = $(HOME):/host-files

# fish

clean-fish:
	docker rmi -f fish

build-fish: clean-fish
	docker build \
		--build-arg HOST_USER_ID=$$(id --user) \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		-t fish \
		fish

run-fish:
	docker run \
		-e CONTAINERS="$(containers)" \
		-e VOLUMES="$(foreach volume,$(volumes),-v $(volume))" \
		-v $(volumes) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--rm \
		-it \
		fish

# git

clean-git:
	docker rmi -f git

build-git: clean-git
	docker build \
		-t git \
		--build-arg HOST_USER_ID=$$(id --user) \
		git

run-git:
	docker run --rm git --version
