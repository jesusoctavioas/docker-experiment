########## BEGIN SSH SCRIPTS CREATION ##########

non-interactive_container_flags = --rm $\$$PWD
interactive_container_flags = --rm -it -w $\$$PWD
# TODO: fix this hardcoded DISPLAY variable
graphical_container_flags = --rm -it -v x11-shared:/tmp/.X11-unix -e DISPLAY=:1 -e XAUTHORITY=/tmp/.X11-unix/container-cookie

# path where scripts for running containers are stored
ssh_scripts_path = ssh-container/scripts

# get the script path for a particular container
ssh_script = $(ssh_scripts_path)/$(notdir $(1))

# containers that will receive the ssh keys 
ssh_keys_containers = st fish

# check if container should receive the ssh keys
has_ssh_keys = $(and $(findstring $(notdir $(1)),$(ssh_keys_containers)),-v ssh-keys:/home/$(notdir $(1))/.ssh)

# get the container type, can be either: "non-interactive", "interactive" or "graphical"
container_type = $(shell basename $(dir $(1)))

# get the appropriate docker launch flags according to the container type
container_flags = $(call container_type,$(1))_container_flags

clean-ssh-scripts:
	rm -f $(ssh_scripts_path)/*

create-ssh-scripts: clean-ssh-scripts
	$(foreach container,$(containers),$(file > $(call ssh_script,$(container)),#!/bin/sh))
	$(foreach container,$(containers),$(file >> $(call ssh_script,$(container)),docker run $(call has_ssh_keys,$(container)) $($(call container_flags,$(container))) $(notdir $(container) $$@)))
	$(foreach container,$(containers),$(shell chmod +x $(call ssh_script,$(container))))

########## END SSH SCRIPTS CREATION ##########

DOCKER_GROUP_ID = $(shell stat -c '%g' /var/run/docker.sock)

clean-ssh:
	docker rmi -f ssh

build-ssh: clean-ssh create-ssh-scripts
	docker build \
		-t ssh \
		--build-arg DOCKER_GROUP_ID="$(DOCKER_GROUP_ID)" \
		ssh-container

clean-ssh-volumes:
	docker volume rm -f ssh-keys x11-shared

create-ssh-volumes: clean-ssh-volumes
	docker volume create ssh-keys
	docker volume create x11-shared

run-ssh: create-ssh-volumes
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ssh-keys:/home/client/ssh-keys \
		-p 22:22 \
		-d \
		--name ssh \
		--hostname ssh \
		--rm \
		ssh
