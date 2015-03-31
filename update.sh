#!/usr/bin/env sh
git pull origin master
git submodule init
git submodule update
git submodule foreach --recursive git submodule update --init
git submodule foreach "git pull origin master"
git st
git ups
git push origin master
