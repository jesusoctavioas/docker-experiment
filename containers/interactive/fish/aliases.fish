# by default, the container sends a string, it must be splited to become an array
set CONTAINERS (string split ' ' $CONTAINERS)

# these aliases are required for running containerized tools just specifying their names
for container in $CONTAINERS;
  set container_name (basename "$container")
  set container_alias_flags "--rm $VOLUMES"

  set container_parent_directory (dirname "$container")
  set container_type (basename "$container_parent_directory")

  switch "$container_type"
    case interactive
      # run on interactive mode
      set -a container_alias_flags "-it -w \$PWD"
    case graphical
      # pass the XAUTHORITY here so it doesn't need to be defined on every container
      set -a container_alias_flags "-it --net=host -v x11-shared:/tmp/.X11-unix -e DISPLAY=\$DISPLAY -e XAUTHORITY=/tmp/.X11-unix/container-cookie -d"
    case '*'
      set -a container_alias_flags "-w \$PWD"
  end

  # $VOLUMES contains all the parent container volumes (without the docker socket)
  alias $container_name "docker run $container_alias_flags $container_name"
end
