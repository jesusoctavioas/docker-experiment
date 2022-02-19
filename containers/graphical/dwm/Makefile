clean-dwm:
	docker rmi -f dwm

build-dwm: clean-dwm
	docker build \
		-t dwm \
		containers/graphical/dwm

run-dwm:
	docker run -v /run/udev:/run/udev --privileged --rm -it dwm
