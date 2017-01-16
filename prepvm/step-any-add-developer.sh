#!/bin/bash
#
# Add a new developer to git-server (over https)
#
# @author Tim Lauv

sudo htpasswd /etc/nginx/.htpasswd "$@"