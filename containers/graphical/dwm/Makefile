containers = $(shell find ./containers/** -mindepth 1 -not -path "*dwm*" -type d)

non-interactive_container_flags = --rm $\$$PWD
interactive_container_flags = --rm -it -w $\$$PWD
graphical_container_flags = --rm -it --net=host -v x11-shared:/tmp/.X11-unix -e DISPLAY=$\$$DISPLAY -e XAUTHORITY=/tmp/.X11-unix/container-cookie -d

# path where scripts for running containers are stored
container_scripts_path = containers/graphical/dwm/scripts

# get the script path for a particular container
container_script = $(container_scripts_path)/$(notdir $(1))

# containers that will receive the docker socket
docker_access_containers = st fish

# check if container should receive the docker socket
has_docker_access = $(and $(findstring $(notdir $(1)),$(docker_access_containers)),-v /var/run/docker.sock:/var/run/docker.sock)

# get the container type, can be either: "non-interactive", "interactive" or "graphical"
container_type = $(shell basename $(dir $(1)))

# get the appropriate docker launch flags according to the container type
container_flags = $(call container_type,$(1))_container_flags

clean-container-scripts:
	rm -f $(container_scripts_path)/*

create-container-scripts: clean-container-scripts
	$(foreach container,$(containers),$(file > $(call container_script,$(container)),#!/bin/sh))
	$(foreach container,$(containers),$(file >> $(call container_script,$(container)),generate-x11-cookie))
	$(foreach container,$(containers),$(file >> $(call container_script,$(container)),docker run $(call has_docker_access,$(container)) $($(call container_flags,$(container))) $(notdir $(container))))
	$(foreach container,$(containers),$(shell chmod +x $(call container_script,$(container))))

clean-dwm:
	docker rmi -f dwm

build-dwm: clean-dwm create-container-scripts
	docker build \
		-t dwm \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		containers/graphical/dwm

clean-volumes:
	docker volume rm -f x11-shared container-scripts

create-volumes:
	docker volume create x11-shared
	docker volume create container-scripts

run-dwm: clean-volumes create-volumes
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /run/udev:/run/udev \
		-v x11-shared:/tmp/.X11-unix \
		-v container-scripts:/usr/local/bin \
		-e CONTAINERS="$(containers)" \
		--privileged \
		--rm \
		-it \
		--name dwm \
		dwm
