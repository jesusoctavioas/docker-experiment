# by default, the container sends a string, it must be splited to become an array
set CONTAINERS (string split ' ' $CONTAINERS)

# these aliases are required for running containerized tools just specifying their names
for container in $CONTAINERS;
  set container_name (basename "$container")
  set container_alias_flags "--rm -w \$PWD $VOLUMES"

  set container_parent_directory (dirname "$container")
  set container_type (basename "$container_parent_directory")

  switch "$container_type"
    case interactive
      # run on interactive mode
      set -a container_alias_flags "-it"
    case graphical
      # run on interactive mode on the background, and share the host X11 socket with the container
      set -a container_alias_flags "-it --net=host -e DISPLAY=\$DISPLAY -v \$XAUTHORITY:/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix -d"
  end

  # $VOLUMES contains all the parent container volumes (without the docker socket)
  alias $container_name "docker run $container_alias_flags $container_name"
end
