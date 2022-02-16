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

# node

clean-node:
	docker rmi -f node

build-node: clean-node
	docker build \
		-t node \
		--build-arg HOST_USER_ID=$$(id --user) \
		node

run-node:
	docker run --rm node --version

# npm

clean-npm:
	docker rmi -f npm

build-npm: clean-npm
	docker build \
		-t npm \
		--build-arg HOST_USER_ID=$$(id --user) \
		npm

run-npm:
	docker run --rm npm --version
