# tools
alias doas "doas --"
alias nv "nvim --startuptime /tmp/nvim-startuptime"
alias paru "paru --sudo doas --sudoflags --"
alias ls 'ls -Alhv --group-directories-first --color=always'
alias grep 'grep --color=always'
alias free 'free -h'
alias df 'df -h'

# reload fish
alias refish "source $__fish_config_dir/config.fish"

# git
if is-docker-container
  # $HOSTNAME becomes the container id when inside a docker container
  alias dots "docker run --rm --volumes-from $HOSTNAME git --git-dir=$HOME/repos/dots/.git --work-tree=$HOME/repos/dots"
else
  alias dots "git --git-dir=$HOME/repos/dots/.git --work-tree=$HOME/repos/dots"
end

# pacman
alias pacup "doas pacman -Syyu"
alias paccl "doas pacman -Rns (pacman -Qqdt)"
alias pacmirror "doas reflector --sort age -c Brazil --save /etc/pacman.d/mirrorlist"
