clean-nvim:
	docker rmi -f nvim

build-nvim: clean-nvim
	docker build \
		-t nvim \
		--build-arg HOST_USER_ID=$$(id --user) \
		containers/interactive/nvim

run-nvim:
	docker run --rm nvim --version
