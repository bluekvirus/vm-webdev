#!/bin/bash
#
# Add a new project to git-server (over https)
#
# @author Tim Lauv

PROJ=~/Project/shared/"$@"
sudo mkdir $PROJ
cd $PROJ
git init --bare --shared