# docker-experiment

> Encapsulating (almost) every single software on my computer in a Docker
container

### Summary

- [What?](#what)
- [Why?](#why)
- [How?](#how)
- [FAQ](#faq)
  - [Doesn't exposing the host docker socket to a container opens a security vulnerability](#doesnt-exposing-the-host-docker-socket-to-a-container-opens-a-security-vulnerability)
- [Known bugs](#known-bugs)
- [Roadmap](#roadmap)

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

> Optionally, you can also build the container image for tools that you would
like to use inside the container

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

### Known bugs

- Auto-completion is not working well with fish, i think it has something to do with the fact that completions are on a separated container and need to be mounted

### Roadmap

- Add support for graphical applications (both X11 and Wayland)
