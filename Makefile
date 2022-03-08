# use Docker BuildKit for faster builds with caching enabled
export DOCKER_BUILDKIT=1

# used for creating shortcut scripts
containers = $(shell find ./containers/** -mindepth 1 -not -path "*dwm*" -type d)

include ssh-container/Makefile

include containers/interactive/fish/Makefile
include containers/interactive/nvim/Makefile
include containers/interactive/node/Makefile
include containers/graphical/dwm/Makefile
include containers/graphical/firefox/Makefile
include containers/graphical/st/Makefile
include containers/non-interactive/git/Makefile
include containers/non-interactive/npm/Makefile
