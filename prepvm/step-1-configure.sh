#!/bin/bash
#
# @author Tim Lauv
# @updated 2015.11.17
# @updated 2016.12.24 (using /etc/nginx/sites-enabled instead of /conf.d)

echo "Configuring VM..."
USER=ubuntu

#Generate an SSL cert/key combo for HTTPs (change -subj value with your own attributes)
SSL_CERTNKEY=/vagrant/settings/https-cert
if [ ! -e $SSL_CERTNKEY ]; then
  sudo mkdir -p $SSL_CERTNKEY
  sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
      -keyout $SSL_CERTNKEY/https.key -out $SSL_CERTNKEY/https.crt \
      -subj "/C=US/ST=CA/L=Sunnyvale/O=Stagejs/OU=Web Application Team/CN=demo.wat-stagejs.com"
fi
sudo rm -rf /usr/share/https-cert
sudo ln -s $SSL_CERTNKEY /usr/share/https-cert #Use this as path to certificates in https servers.

#Expose Nginx server configure (v1.6+)
NGINX_CFG=/vagrant/settings/nginx-config
if [ ! -e $NGINX_CFG/servers.d ]; then
  sudo mkdir -p $NGINX_CFG
  sudo mv /etc/nginx/sites-enabled $NGINX_CFG/servers.d
  sudo chmod -R 777 $NGINX_CFG
fi
sudo rm -rf /etc/nginx/sites-enabled
sudo ln -s $NGINX_CFG/servers.d /etc/nginx/sites-enabled
if [ ! -e /etc/nginx/.htpasswd ]; then
  sudo cp $NGINX_CFG/.htpasswd /etc/nginx/.htpasswd

#Expose default web root from /usr/share/nginx/html
WEBROOT=/vagrant/www
if [ ! -e $WEBROOT ]; then
  sudo mv /usr/share/nginx/html $WEBROOT
fi
sudo rm -rf /usr/share/nginx/html
sudo ln -s $WEBROOT /usr/share/nginx/html

#Expose default git server root from ~/Projects/shared/
GITROOT=/home/$USER/Projects/shared
if [ ! -e $GITROOT ]; then
	sudo mkdir $GITROOT
	sudo chgrp -R www-data $GITROOT
	sudo chmod g+s $GITROOT
fi

#Change .npm registry permission
sudo mkdir -p /home/$USER/.npm
sudo chown -R $USER /home/$USER/.npm

#[optional]Set default git user & email
#git config --global user.name "YOUR NAME"
#git config --global user.email "YOUR EMAIL ADDRESS"
  
echo "VM configured, use 'vagrant ssh' to login."