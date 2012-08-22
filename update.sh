#!/usr/bin/env sh

git submodule foreach --recursive git submodule update --init
#git submodule foreach "(git checkout master; git pull)&"
#git submodule bundle/vim-powerline "(git checkout develop; git pull)&"
