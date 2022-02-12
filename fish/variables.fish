fish_add_path ~/.local/bin
fish_add_path ~/.local/bin/statusbar

# disable welcome message
set fish_greeting

# custom path for plugins
# fisher itself must be installed on the default "functions" directory
# otherwise, without it, this variable wouldn't work
set fisher_path "$__fish_config_dir/plugins"

# gruvbox colorscheme
set fish_color_command green
set fish_color_error red --bold
set fish_color_param brblue

# XDG base directories
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"

# contains executables of crates installed via `cargo install` or `rustup`
fish_add_path "$XDG_DATA_HOME/cargo/bin"

set -x EDITOR nvim

# rustup metadata and toolchains
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"

# cargo configuration directory
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"

# prevent wayland from hiding the cursor on virtual machines
set -x WLR_NO_HARDWARE_CURSORS 1
