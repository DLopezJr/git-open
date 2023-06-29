.POSIX:

#VARIABLES
PREFIX = /usr/local

#TARGETS
install:
	cp    git-open.sh $(PREFIX)/bin/git-open
	chmod 755         $(PREFIX)/bin/git-open
  
uninstall:
	rm $(PREFIX)/bin/git-open

config:
	@#find "/etc/gitconfig" "$XDG_CONFIG_HOME/git/config" "$HOME/.config/git/config" -type f 2>/dev/null | awk '!/No such file/ { print $0; }'    
