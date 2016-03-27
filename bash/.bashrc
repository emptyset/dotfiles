pushd () { 
    command pushd "$@" > /dev/null 
}

popd () { 
    command popd "$@" > /dev/null 
}

function load_sourcefiles {
    for SOURCE_FILE in *.bash; do
        . $SOURCE_FILE
    done
    for ALIAS_FILE in *.alias; do
        . $ALIAS_FILE
    done
}

export DOTFILES=~/.dotfiles
TOPIC_BASH=$DOTFILES/bash

. $TOPIC_BASH/private/.bashenv

pushd $TOPIC_BASH
load_sourcefiles
popd

pushd $TOPIC_BASH/private
load_sourcefiles
popd

# TODO: migrate this out of here (once *.bash script order scheme is established)
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
