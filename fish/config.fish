set containerized_tools (find $HOME/repos -mindepth 1 -maxdepth 1 -not -path "*/.*" -type d -exec basename {} \;)

# these aliases are required for running containerized tools just specifying their names
# $HOSTNAME becomes the container id when inside a docker container
for tool in $containerized_tools;
  alias $tool "docker run --rm -w \$PWD --volumes-from \$HOSTNAME $tool"
end

alias dots "git --git-dir=$HOME/repos/dots/.git --work-tree=$HOME/repos/dots"
