clean-fish:
	docker rmi -f fish

build-fish: clean-fish
	docker build -t fish containers/interactive/fish

run-fish:
	docker run --rm -it fish
