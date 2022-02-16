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

### FAQ

#### Doesn't exposing the host docker socket to a container opens a security vulnerability

Yes, but the sibling containers will run with a non-root user, hence, they won't
have permission to interact with the host Docker daemon

Even though the main container (fish) has such permission, everything is
meant to be executed through unprivilleged containers, making such exploit
uneffective
