containers = $(shell find ./containers/** -mindepth 1 -type d)
volumes = $(HOME):/host-files

clean-fish:
	docker rmi -f fish

build-fish: clean-fish
	docker build \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		-t fish \
		containers/interactive/fish

run-fish:
	docker run \
		-e XAUTHORITY="$(XAUTHORITY)" \
		-e DISPLAY="$(DISPLAY)" \
		-e CONTAINERS="$(containers)" \
		-e VOLUMES="$(foreach volume,$(volumes),-v $(volume))" \
		-v $(volumes) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--rm \
		-it \
		fish
