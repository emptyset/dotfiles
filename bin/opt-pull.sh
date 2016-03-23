#!/usr/bin/env zsh

DOTFILES=~/.dotfiles

pushd $DOTFILES
rm -rf opt
mkdir -p opt
popd

pushd $DOTFILES/opt
git clone git@github.com:seebi/dircolors-solarized.git
git clone git@github.com:jimeh/git-aware-prompt.git
popd
