containers = $(shell find ./containers/** -mindepth 1 -type d)

clean-dwm:
	docker rmi -f dwm

build-dwm: clean-dwm
	docker build \
		-t dwm \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		containers/graphical/dwm

clean-volumes:
	docker volume rm -f x11-shared

create-volumes:
	docker volume create x11-shared

run-dwm: clean-volumes create-volumes
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /run/udev:/run/udev \
		-v x11-shared:/tmp/.X11-unix \
		-e CONTAINERS="$(containers)" \
		--privileged \
		--rm \
		-it \
		--name dwm \
		dwm
