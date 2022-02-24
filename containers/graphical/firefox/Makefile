clean-firefox:
	docker rmi -f firefox

build-firefox: clean-firefox
	docker build -t firefox containers/graphical/firefox

run-firefox:
	docker run --rm firefox --version
