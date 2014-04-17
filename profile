# mkaz bash init
# vim: syntax=sh ts=4 sw=4 sts=4 sr et

SYS_OS=`uname -s`

if [[ -e /etc/is-aws ]]; then
    SHORT_HOSTNAME='aws'
else
    SHORT_HOSTNAME=`hostname -s`
fi

source ~/dotfiles/extras/colors
source ~/dotfiles/bin/z.sh
source ~/dotfiles/aliases.shared

# set system specific path / aliases
if [[ "$SYS_OS" == 'Linux' ]]; then
	source ~/dotfiles/profile.lx
else
	source ~/dotfiles/profile.osx
fi

# run host specific profile
if [[ -e ~/Documents/Sync/dot-secret/profile.$SHORT_HOSTNAME ]]; then
    source ~/Documents/Sync/dot-secret/profile.$SHORT_HOSTNAME
fi

# run a8c profile
if [[ -e ~/Documents/Sync/dot-secret/profile.a8c ]]; then
    source ~/Documents/Sync/dot-secret/profile.a8c
fi


# prompt (colors defined in colors file)
FANCY="\342\226\270"
export PS1="\[$Cyan\]\h: \[$Green\]\W \[$Yellow\]$FANCY \[$Color_Off\] "


PATH=".:$PATH"
export PATH

export TZ='America/Los_Angeles'
export TERM='xterm-256color'
export HISTFILE=$HOME/.zhistory
export HISTSIZE=5000
export SAVEHIST=5000
export HOSTNAME="`hostname`"
export PAGER='less'
export EDITOR='vim'
export SVN_EDITOR='vim'
export GNUTERM=x11


## for pass
if [[ -e /etc/bash_completion.d/password-store ]]; then
    source /etc/bash_completion.d/password-store
fi

