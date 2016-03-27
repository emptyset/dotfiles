function load_sourcefiles {
    for SOURCE_FILE in *.zsh; do
        echo "Loading $SOURCE_FILE"
        source $SOURCE_FILE
    done
    for ALIAS_FILE in *.alias; do
        echo "Loading $ALIAS_FILE"
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

# TODO: fix this by introducing ordering to *sh scripts
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
