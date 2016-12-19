#!/bin/bash
#
# @author Tim Lauv
# @updated 2015.11.17

#Prep latest repos - Nginx
NGX_REPO_KEY=/tmp/nginx_signing.key
if [ ! -e $NGX_REPO_KEY ]; then
  curl http://nginx.org/keys/nginx_signing.key > $NGX_REPO_KEY
  sudo apt-key add $NGX_REPO_KEY
  sudo echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
  sudo echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
fi

#Install git, c, node, elixir, pip/pip3, supervisor, nginx, postgres, mongo, redis, rabbitmq and graphicsmagick
ERLANG_PACK=erlang-solutions_1.0_all.deb
wget https://packages.erlang-solutions.com/$ERLANG_PACK && sudo dpkg -i $ERLANG_PACK
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash
#Can use https://deb.nodesource.com/setup_<major>.<minor> instead for latest nodejs & npm.
sudo apt-get install -y build-essential valgrind git nodejs elixir python-pip python3-pip python-virtualenv \
                        supervisor nginx postgresql mongodb redis-server rabbitmq-server \
                        graphicsmagick inxi linux-tools-generic

#Install global npm packages:
sudo npm -g install bower gulp forever http-server browser-sync

#clean up
rm $ERLANG_PACK 
