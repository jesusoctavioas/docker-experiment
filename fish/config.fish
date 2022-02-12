# source is the recommended way to evaluate commands of the specified file
# "." (period) is an alias for source, but it's deprecated and will be
# removed in a future version of fish

source "$__fish_config_dir/variables.fish"
source "$__fish_config_dir/aliases.fish"

# automatically loads plugins under "$fisher_path"
source "$fisher_path/functions/fisher_path.fish"

# Starts X11 if current display is a tty, and sway is not running
if not is-docker-container; and test -z "$DISPLAY"; and test "$XDG_VTNR" -eq 1
    pgrep sway || exec sway
end
