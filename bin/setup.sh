#!/usr/bin/env zsh

export DOTFILES=~/.dotfiles

set extendedglob
setopt null_glob

function list_targets {
    # TODO: globbing is not my friend today; perhaps an easier way to exclude files with certain suffixes
    eval "$1=(`print -l .*(.) .*(/) *(.e:'[[ ! ($REPLY =~ \.alias$) && ! ($REPLY =~ \.*sh$) ]]':) ^(private|volatile)*(/)`)"
}

function symlink_target {
    #mv -v $HOME/$2 $HOME/tmp/$2.moved
    SOURCE=$HOME/$2
    TARGET=$DOTFILES/$1/$2
    [[ -h $SOURCE ]] && rm -v $SOURCE
    ln -vs $TARGET $SOURCE
}

pushd $DOTFILES
TOPICS=(`print -l ./*(/e:'[[ $REPLY != "./bin" && $REPLY != "./opt" ]]':)`)
for TOPIC in $TOPICS; do
    # echo "topic: $TOPIC:t"
    FOLDERS=("$TOPIC:t")
    [[ -d "$TOPIC/private" ]] && FOLDERS+=("$TOPIC:t/private")
    [[ -d "$TOPIC/volatile" ]] && FOLDERS+=("$TOPIC:t/volatile")
    for FOLDER in $FOLDERS; do
        #echo "folder: $FOLDER"
        pushd $FOLDER
        TARGETS=()
        list_targets TARGETS
        for TARGET in $TARGETS; do
            symlink_target $FOLDER $TARGET:t
        done
        popd
    done
done
popd
