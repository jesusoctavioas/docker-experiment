# docker-experiment

> Encapsulating (almost) every single software on my computer in a Docker
container

### Summary

- [What?](#what)
- [Why?](#why)
- [How?](#how)
- [FAQ](#faq)
  - [Doesn't exposing the host docker socket to a container opens a security vulnerability?](#doesnt-exposing-the-host-docker-socket-to-the-ssh-container-opens-a-security-vulnerability)
- [Known bugs](#known-bugs)
- [Roadmap](#roadmap)

### What?

This is a on-going experiment that tries to create a totally modular Linux
environment using only Docker containers

### Why?

- Removes the need of installing software on your host machine
- Keeps your filesystem clean from dozens of configuration files for each tool
that you use
- Allows running untrusted software on a sandboxed environment

### How?

> The instructions below assume that you already have both `docker` and `make`
installed on your machine

To get started, build the essential images with the command below:

```shell
make make-build-ssh build-dwm build-st build-fish
```

> Optionally, you can also build the container image for tools that you would
like to use inside the container

Then, we need to start both the SSH server that will be responsible for
launching the Docker containers securely, and also the `dwm` that will be our
window manager:

```shell
make run-ssh run-dwm
```

Now you can use all the other tools available inside the container

### FAQ

#### Doesn't exposing the host Docker socket to the SSH container opens a security vulnerability

Indeed, but by default, the shell of the `client` user on the SSH server is
forced execute a script that intercepts **ALL** commands and translates them
into `docker run` instructions

This means that even if a malicious user/script could connect to the SSH server,
it wouldn't be able to do literally anything besides running containers

### Known bugs

- Auto-completion is not working well with fish, i think it has something to do with the fact that completions are on a separated container and need to be mounted
