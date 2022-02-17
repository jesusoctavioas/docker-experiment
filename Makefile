include containers/interactive/fish/Makefile
include containers/interactive/nvim/Makefile
include containers/non-interactive/git/Makefile
include containers/non-interactive/node/Makefile
include containers/non-interactive/npm/Makefile

hello:
	echo $(containers)
