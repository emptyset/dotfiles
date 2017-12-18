#!/usr/bin/env zsh

TODAY=`date +'%Y%m%d_%H%M%S'`
FILENAME=${TODAY}_HOME.tar.bz2

pushd ~
# TODO: specify list of directories to exclude in private .*env files
tar \
    --exclude .dotfiles/chef/ \
    --exclude .dotfiles/docker/ \
    --exclude .dotfiles/vagrant/ \
    --exclude .dotfiles/ \
    --exclude bak/ \
    --exclude Library/ \
    --exclude tmp/ \
    --exclude="VirtualBox VMs/" \
    -cpjvf bak/$FILENAME .
popd
