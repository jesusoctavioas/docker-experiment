clean-git:
	docker rmi -f git

build-git: clean-git
	docker build \
		-t git \
		--build-arg HOST_USER_ID=$$(id --user) \
		containers/non-interactive/git

run-git:
	docker run --rm git --version
