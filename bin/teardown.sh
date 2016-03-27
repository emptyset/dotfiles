#!/usr/bin/env zsh

export DOTFILES=~/.dotfiles

set extendedglob
setopt null_glob

pushd $DOTFILES
TOPICS=(`print -l ./*(/e:'[[ $REPLY != "./bin" && $REPLY != "./opt" ]]':)`)
for TOPIC in $TOPICS; do
    stow -v -D $TOPIC:t
    [[ -d "$TOPIC/private" ]] && stow -v -D -d $TOPIC:t -t $HOME private
    [[ -d "$TOPIC/volatile" ]] && stow -v -D -d $TOPIC:t -t $HOME volatile
done
popd
