function load_sourcefiles {
    for SOURCE_FILE in *.zsh; do
        source $SOURCE_FILE
    done
    for ALIAS_FILE in *.alias; do
        source $ALIAS_FILE
    done
}

setopt pushdsilent

export DOTFILES=~/.dotfiles
TOPIC_ZSH=$DOTFILES/zsh

pushd $TOPIC_ZSH
load_sourcefiles
popd

pushd $TOPIC_ZSH/private
load_sourcefiles
popd

fortune -a | cowsay -f hypnotoad | lolcat
