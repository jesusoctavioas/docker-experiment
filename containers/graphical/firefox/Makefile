clean-firefox:
	docker rmi -f firefox

build-firefox: clean-firefox
	docker build \
		-t firefox \
		--build-arg HOST_USER_ID=$$(id --user) \
		containers/graphical/firefox

run-firefox:
	docker run --rm firefox --version
