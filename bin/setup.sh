#!/usr/bin/env zsh

set extendedglob
setopt null_glob

DOTFILES=~/.dotfiles
pushd $DOTFILES
stow -v stow
TOPICS=(`print -l ./*(/e:'[[ $REPLY != "./bin" && $REPLY != "./opt" && $REPLY != ./stow ]]':)`)
for TOPIC in $TOPICS; do
    stow -v $TOPIC:t
    [[ -d "$TOPIC/private" ]] && stow -v -d $TOPIC:t -t $HOME private
    [[ -d "$TOPIC/volatile" ]] && stow -v -d $TOPIC:t -t $HOME volatile
done
popd
