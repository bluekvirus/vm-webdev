#!/bin/bash

  #Generate an SSL cert/key combo for HTTPs (change -subj value with your own attributes)
  SSL_CERTNKEY=~/synced_folder/settings/https-cert
  if [ ! -e $SSL_CERTNKEY ]; then
    sudo mkdir -p $SSL_CERTNKEY
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout $SSL_CERTNKEY/https.key -out $SSL_CERTNKEY/https.crt \
        -subj "/C=US/ST=CA/L=Sunnyvale/O=Fortinet/OU=Web Application Team/CN=demo.wat-fortinet.com"
  fi
  sudo rm -rf /usr/share/https-cert
  sudo ln -s $SSL_CERTNKEY /usr/share/https-cert #Use this as path to certificates in https servers.

  #Expose Nginx server configure (v1.6+)
  NGINX_CFG=~/synced_folder/settings/nginx-config
  if [ ! -e $NGINX_CFG/conf.d ]; then
    sudo mkdir -p $NGINX_CFG
    sudo cp -r /etc/nginx/conf.d $NGINX_CFG
    sudo chmod -R 777 $NGINX_CFG
  fi
  sudo rm -rf /etc/nginx/conf.d
  sudo ln -s $NGINX_CFG/conf.d /etc/nginx/conf.d
  sudo service nginx restart

  #Expose default web root from /usr/share/nginx/html
  WEBROOT=~/synced_folder/www
  if [ ! -e $WEBROOT ]; then
    sudo mv /usr/share/nginx/html $WEBROOT
  fi
  sudo rm -rf /usr/share/nginx/html
  sudo ln -s $WEBROOT /usr/share/nginx/html

  #Make sure the projects folder exists
  PROJECTS=~/synced_folder/projects
  if [ ! -e $PROJECTS ]; then
    sudo mkdir -p $PROJECTS
  fi

  #Change .npm registry permission
  sudo chmod -R 777 ~/.npm
  
