#!/bin/bash
#
# @author Tim Lauv
# @updated 2015.11.17
# @updated 2016.12.24

echo "Provisioning VM..."

#Prep latest repos - Nginx (no longer needed)
#NGX_REPO_KEY=/tmp/nginx_signing.key
#if [ ! -e $NGX_REPO_KEY ]; then
#  curl http://nginx.org/keys/nginx_signing.key > $NGX_REPO_KEY
#  sudo apt-key add $NGX_REPO_KEY
#  sudo echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
#  sudo echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
#fi

#Generate locale
#sudo locale-gen UTF-8

#Ubuntu 16.04-LTS already comes with C11 (gcc 5.4+) and Python3.5+
#Install git, go, node v4, elixir, pip/pip3, virtualenv, celery, supervisor, nginx, postgres, mongo, redis, rabbitmq and graphicsmagick
ERLANG_PACK=erlang-solutions_1.0_all.deb
wget https://packages.erlang-solutions.com/$ERLANG_PACK && sudo dpkg -i $ERLANG_PACK
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash
#Can use https://deb.nodesource.com/setup_<major>.<minor> instead for latest nodejs & npm.
sudo apt-get install -y build-essential git golang nodejs elixir python-pip python3-pip \
                        supervisor nginx postgresql libpq-dev mongodb redis-server rabbitmq-server uwsgi-core uwsgi-plugin-python3 \
                        graphicsmagick valgrind inxi linux-tools-generic inotify-tools fcgiwrap apache2-utils pandoc

#Install global pip packages:
sudo pip install --upgrade pip
sudo pip install virtualenv
sudo pip install celery
sudo pip install zest.releaser[recommended]

#Install global npm packages:
sudo npm -g install less bower gulp forever http-server 

#clean up
sudo rm $ERLANG_PACK 

echo "VM provisioned."
