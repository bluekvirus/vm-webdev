Dev Box
=======
This is the developer box to use for web application development/demo/experiments through Vagrant.


Initialize
----------

0. Install Vagrant on your machine. [Instructions](https://docs.vagrantup.com/)
1. `git clone` this repo to your work directory.
2. `vagrant up` to initialize and provision the box.
3. `vagrant ssh` into the box and run

Now, open your favourite text editor and start coding! The directory containing the `Vagrantfile` is shared into the vm at path `/vagrant`. Your `~/Projects` folder (if there is one and hopefully holding all the git repos) will be mapped into the vm at `~/Projects`. Also you can modify the content inside the `www` folder and the `settings` folder to change our default nginx setup in the vm (e.g add servers and static web files for different projects). 

**Tip**: Don't worry about `vagrant destroy`. Reconstructing the virtual machine will not override your changes made in `www`, `settings` and `~/Projects`.

**Note**: You can use multiple boxes but for development purposes only one or two would be enough.You can put all your web applications under a `~/Projects` folder on the host machine and by default (see Vagrantfile `config.vm.synced_folder` setting) will be mapped to `~/Projects` (you will see this folder after `vagrant ssh` into the vm) to share the web server, database, cache server and message queues made available within the vm. If you want to test deployment or want to use a DevOps environment for development please consider using [Docker](https://www.docker.com/) containers 
with [Fig](http://www.fig.sh/).


Goodies
-------

* Git
* Nodejs (with Bower, Gulp, Http-Server, Forever, Browsersync)
* Python 2/3 (with pip/pip3)
* Supervisor
* Nginx 
* PostgreSQL
* MongoDB
* Redis
* RabbitMQ
* GraphicsMagick

**Tip**: The services are listening to their default ports and without secured setups since only your applications can access them. 

###Default Settings
See [settings](./settings/README.md) for default settings of Nginx, PostgreSQL, MongoDB, Redis and RabbitMQ.


Quick Start
-----------
Put some static content under the `www` folder, and access `192.168.3.100` from your host machine.The `www` folder has a symlink at `/usr/share/nginx/html`. You might consider building into the `www` folder's subfolders with your project build tools and organize them using a site intro `index.html`.

**Tip**: Proxy your Ajax api calls to your applications using the Nginx web server's `proxy_pass` and `uwsgi_pass` directives. Add them in `settings/nginx-confg`.

To connect to databases, k-v stores and message queues see [settings](./settings/README.md)


Suggested Workflow
------------------

1. `vagrant ssh` into the box and run/stop your applications and services.
2. Scaffold and code outside the box; Build and test inside the box.
3. Change the `Vagrantfile` configure to include more port mappings for demoing purposes.
4. Put/Change service configure files inside `settings` and symlink them back into service daemons.


Customize
---------
You can run `vagrant reload` after changing the networking and folder sharing settings in `Vagrantfile` to 
apply the changes to the box.

**Note**: Although it wouldn't hurt to run the `vagrant provision` command to execute the provision script again, it is usually not needed.
