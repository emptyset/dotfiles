#!/usr/bin/env zsh

TODAY=`date +'%Y%m%d_%H%M%S'`
FILENAME=${TODAY}_HOME.tar.bz2

pushd ~
# TODO: specify list of directories to exclude in private .*env files
tar --exclude bak/ --exclude Library/ --exclude tmp/ -cpjvf bak/$FILENAME . 
popd
