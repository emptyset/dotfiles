TOPIC_BASH=$DOTFILES/bash

function load_sourcefiles {
    for SOURCE_FILE in *.bash; do
        . $SOURCE_FILE
    done
    for ALIAS_FILE in *.alias; do
        . $ALIAS_FILE
    done
}

. $TOPIC_BASH/private/.bashenv

pushd $TOPIC_BASH
load_sourcefiles
popd

pushd $TOPIC_BASH/private
load_sourcefiles
popd
