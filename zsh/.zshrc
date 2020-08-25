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
