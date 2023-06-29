.POSIX

  config:
    @find "/etc/gitconfig" "$XDG_CONFIG_HOME/git/config" "$HOME/.config/git/config" -type f 2>/dev/null | awk '!/No such file/ { print $0; }'    
