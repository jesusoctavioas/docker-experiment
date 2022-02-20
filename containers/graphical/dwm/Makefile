clean-dwm:
	docker rmi -f dwm

build-dwm: clean-dwm
	docker build \
		-t dwm \
		--build-arg DOCKER_GROUP_ID=$$(stat -c '%g' /var/run/docker.sock) \
		containers/graphical/dwm

run-dwm:
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v /run/udev:/run/udev --privileged --rm -it dwm
