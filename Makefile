# fish

clean-fish:
	docker rmi -f fish

build-fish: clean-fish
	docker build -t fish fish

run-fish:
	docker run \
		-v $(HOME)/.local/bin:/root/.local/bin \
		-v $(HOME)/repos:/root/repos \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--rm \
		-it \
		fish

# git

clean-git:
	docker rmi -f git

build-git: clean-git
	docker build -t git git

run-git:
	docker run \
		--rm \
		git log --oneline
