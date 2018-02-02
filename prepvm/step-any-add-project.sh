#!/bin/bash
#
# Add a new project to git-server (over https)
#
# @author Tim Lauv

USER=ubuntu
PROJ=/home/$USER/Projects/shared/"$@"
sudo mkdir $PROJ
cd $PROJ
git init --bare --shared