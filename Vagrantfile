# -*- mode: ruby -*-
# vi: set ft=ruby :
# 
# Upgrade to vagrant 1.9+ to support VirtualBox v5.0+ (https://www.vagrantup.com/downloads.html)
# 
# Supported provider: virtualbox, docker
# 
# @author Tim Lauv
# @updated 2015.11.17
# @updated 2016.12.24 (use ubuntu 16.04 LTS)

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search. (except --provider=Docker)
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # (already have guest: 22 --> host: 2222 for sshd)
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.3.100"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # (./ with Vagrantfile will be mapped to /vagrant)
  config.vm.synced_folder "~/Projects", "/home/ubuntu/Projects"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  
  # VirtualBox: 
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  
  # Docker:
  config.vm.provider "docker" do |d|
    d.image = "ubuntu:xenial"
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
      
      /vagrant/prepvm/step-0-provision.sh
      /vagrant/prepvm/step-1-configure.sh

      #For python dev please use pip/pip3 to install libs within each pyvenv (virtualenv).
      #For writing tests we recommend BDD (e.g mocha + chai).
      
  SHELL
end
