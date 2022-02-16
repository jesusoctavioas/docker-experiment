clean-node:
	docker rmi -f node

build-node: clean-node
	docker build \
		-t node \
		--build-arg HOST_USER_ID=$$(id --user) \
		node

run-node:
	docker run --rm node --version
