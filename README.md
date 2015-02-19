Dev Box
=======
This is the developer box to use for web application development/demo/experiments through Vagrant.

Initialize
----------

0. Install Vagrant on your machine. [Instructions](https://docs.vagrantup.com/)
1. `git clone` this repo to your work directory.
2. `vagrant up` to initialize and provision the box.
3. `vagrant ssh` into the box and run
```
sudo bash synced_folder/getting-started.sh
```
Now, open the work directory with your favourite text editor and start coding! The directory is shared into the box as `~/synced_folder`. You will also have an empty `projects` folder, a `www` folder and a `settings` folder there with a default nginx setup. 

**Note**: You can use multiple boxes but for development purposes only one or two would be enough.
You can put all your web applications under the `projects` folder and share the web server, 
database(s), cache server(s) and message queue(s). If you want to test deployment or want to use 
a DevOps environment for development please consider using [Docker](https://www.docker.com/) containers 
with [Fig](http://www.fig.sh/).


Quick Start
-----------
Put some static content under the `www` folder, and access `192.168.1.100` from your host machine.
The `www` folder has a symlink at `/usr/share/nginx/html`. You might consider building into the `www` folder's subfolders with your project build tools and organize them using a site intro `index.html`.

**Tip**: Proxy your Ajax api calls to your applications using the Nginx web server's `proxy_pass` and `uwsgi_pass` directives.


Workflow
--------

1. `vagrant ssh` into the box and run/stop your applications and services.
2. Scaffold and code outside the box; Build and test inside the box.
3. Change the `Vagrantfile` configure to include more port mappings for demoing purposes.
4. Put/Change service configure files inside `settings` and symlink them back into service daemons.

HTTPs
-----
Use the prepared cert + key combo for you under `/usr/share/https-cert`.

Goodies
-------

* Git
* Nodejs (with Bower, Gulp, Mocha, Babel(6to5), StrongLoop/Express, Forever...)
* Python 2/3 (with pip/pip3)
* Supervisor
* Nginx (default webroot under `/usr/share/nginx/html`) 
* PostgreSQL
* MongoDB
* Redis
* RabbitMQ
* GraphicsMagick

**Tip**: The services can listen to their default ports and without secured setups since only your 
applications can access them.  

Customize
---------
You can run `vagrant reload` after changing the networking and folder sharing settings in `Vagrantfile` to 
apply the changes to the box.

**Note**: Although it wouldn't hurt to run the `vagrant provision` command to execute the provision script 
again, it is usually not needed.

ToDo
----
* Merge db/cache/mq settings into settings.
