#!/bin/bash
#
# Add a new developer to git-server (over https)
# 
# Tell developer to send theirs, use: htpasswd -n <username>
#
# @author Tim Lauv

sudo htpasswd /etc/nginx/.htpasswd "$@"