type ?= container

clean-st:
	docker rmi -f st

build-st: clean-st
	docker build \
		-t st \
		--target $(type) \
		containers/graphical/st

run-st:
	docker run -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --rm -it st
