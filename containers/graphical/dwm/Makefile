# path where scripts for running containers are stored
container_scripts_path = containers/graphical/dwm/scripts

# get the script path for a particular container
container_script = $(container_scripts_path)/$(notdir $(1))

# check if container is of type "graphical"
is_graphical_container = $(and $(findstring graphical,$(1)),$(2))

clean-container-scripts:
	rm -f $(container_scripts_path)/*

create-container-scripts: clean-container-scripts
	$(foreach container,$(containers),$(file > $(call container_script,$(container)),#!/bin/sh))
	$(foreach container,$(containers),$(file >> $(call container_script,$(container)),$(call is_graphical_container,$(container),generate-x11-cookie)))
	$(foreach container,$(containers),$(file >> $(call container_script,$(container)),ssh -v -t client@172.17.0.2 $(notdir $(container)) $$@))
	$(foreach container,$(containers),$(shell chmod +x $(call container_script,$(container))))

clean-dwm:
	docker rmi -f dwm

build-dwm: clean-dwm create-container-scripts
	docker build \
		-t dwm \
		containers/graphical/dwm

clean-container-volumes:
	docker volume rm -f container-scripts

create-container-volumes: clean-container-volumes
	docker volume create container-scripts

run-dwm: create-container-volumes
	docker run \
		-v /run/udev:/run/udev \
		-v container-scripts:/usr/local/bin \
		-v x11-shared:/tmp/.X11-unix \
		-v ssh-keys:/home/dwm/.ssh \
		-e CONTAINERS="$(containers)" \
		--privileged \
		--rm \
		-it \
		--name dwm \
		--hostname dwm \
		dwm
