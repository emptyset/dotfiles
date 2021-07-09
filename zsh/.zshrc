function log_debug {
    if [[ -v DOTFILES_DEBUG ]]; then
        echo "DEBUG: $1"
    fi
}

log_debug "DOTFILES_DEBUG is set"

function load_aliases {
    for ALIAS_FILE in *.alias; do
        source $ALIAS_FILE
    done
}

function load_sourcefiles {
    for SOURCE_FILE in *.zsh; do
        source $SOURCE_FILE
    done
}

# Moved this up to the front, see if this helps
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/emptyset/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

setopt null_glob
setopt pushdsilent

DOTFILES=~/.dotfiles
TOPIC_ZSH=$DOTFILES/zsh

# resets the path
export PATH=""
# osx-specific workaround, but should be compatible
# TODO: probably following ordering convention similar to /etc/paths.d
source /etc/zprofile

pushd $TOPIC_ZSH
load_sourcefiles
load_aliases
popd

pushd $TOPIC_ZSH/private
load_sourcefiles
load_aliases
popd

setopt clobber

jot -rc 160 32 126 | rs -g 0 4 | cowsay -f hypnotoad | lolcat
