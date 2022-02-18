# use Docker BuildKit for faster builds with caching enabled
export DOCKER_BUILDKIT=1

include containers/interactive/fish/Makefile
include containers/interactive/nvim/Makefile
include containers/interactive/node/Makefile
include containers/graphical/firefox/Makefile
include containers/non-interactive/git/Makefile
include containers/non-interactive/npm/Makefile
