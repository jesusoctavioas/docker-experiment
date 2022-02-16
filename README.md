# docker-experiment

> Encapsulating (almost) every single software on my computer in a Docker
container

### What?

This is a on-going experiment that tries to create a totally modular development
environment using only Docker containers

### Why?

- Removes the need of installing software on your host machine
- Keeps your filesystem clean from dozens of configuration files for each tool
that you use
- Allows running untrusted software on a sandboxed environment

### How?

> The instructions below assume that you already have both `docker` and `make`
installed on your machine

To get started, build the `fish` image with the command below:

```shell
make build-fish
```

Then, start it's container by running:

```shell
make run-fish
```

Now you can use all the other tools available inside the container

### FAQ

#### Doesn't exposing the host docker socket to a container opens a security vulnerability

Yes, but the sibling containers will run with a non-root user, hence, they won't
have permission to interact with the host Docker daemon

Even though the main container (fish) has such permission, everything is
meant to be executed through unprivilleged containers, making such exploit
uneffective
