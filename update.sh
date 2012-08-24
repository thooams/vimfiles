#!/usr/bin/env sh
git pull origin master
git submodule update
git submodule foreach --recursive git submodule update --init
