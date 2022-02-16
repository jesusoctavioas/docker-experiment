set CONTAINERS (string split ' ' $CONTAINERS)

# these aliases are required for running containerized tools just specifying their names
for container in $CONTAINERS;
  # $VOLUMES contains all the parent container volumes (without the docker socket)
  alias $container "docker run --rm -w \$PWD $VOLUMES $container"
end

alias dots "git --git-dir=$HOME/repos/dots/.git --work-tree=$HOME/repos/dots"
