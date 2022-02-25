type ?= container

clean-st:
	docker rmi -f st

build-st: clean-st
	docker build \
		--build-arg HOST_USER_ID=$$(id --user) \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		-t st \
		--target $(type) \
		containers/graphical/st

run-st:
	docker run -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --rm -it st
