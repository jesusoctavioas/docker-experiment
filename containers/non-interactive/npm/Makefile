clean-npm:
	docker rmi -f npm

build-npm: clean-npm
	docker build \
		-t npm \
		--build-arg HOST_USER_ID=$$(id --user) \
		containers/non-interactive/npm

run-npm:
	docker run --rm npm --version
