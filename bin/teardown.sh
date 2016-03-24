#!/usr/bin/env zsh

export DOTFILES=~/.dotfiles

set extendedglob
setopt null_glob

pushd $HOME
LINKS=(`print -l .*(e:'[[ -h $REPLY ]]':) *(.e:'[[ -h $REPLY ]]':)`)
for LINK in $LINKS; do
    rm -v $LINK
done
popd
