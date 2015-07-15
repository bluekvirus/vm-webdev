Host Daemons
============
By default these service daemons will be running after `vagrant up`. You can use `pstree` to see if they are indeed running in the background.


##Nginx (80, 443)
This should already be configured and restarted by `./getting-started.sh`. Add more servers or change existing ones in `settings/nginx-config/conf.d`.

default bind 0.0.0.0

Use `sudo service nginx reload/restart` to reload configure/restart web server. 


##PostgreSQL (5432)
Configure can be located here
```
/etc/postgresql/9.x/main/postgresql.conf
```
default `listen_addresses = 'localhost'` empty list means to allow domain socket only.

Access control can be found here
```
/etc/postgresql/9.x/main/pg_hba.conf
```
You might want to change 
```
host    all             all             127.0.0.1/32            md5
```
into
```
host    all             all             127.0.0.1/32            trust
```
see [more details](http://www.postgresql.org/docs/devel/static/auth-pg-hba-conf.html)

Use `sudo service postgresql restart` to reload the database configure.


##MongoDB (27017)
Configure can be located here
```
/etc/mongodb.conf
```
default `bind_ip = 127.0.0.1` see [more details](http://docs.mongodb.org/v2.4/reference/configuration-options/)

Use `sudo service mongodb restart` to reload the database configure.


##Redis (6379)
Configure can be located here
```
/etc/redis/redis.conf
```
default `bind 127.0.0.1` see [more details](http://www.redis.io/topics/config)

Use `sudo service redis-server restart` to reload the data store configure.


##RabbitMQ (5672)
Configure should be put here
```
/etc/rabbitmq/[rabbitmq.config]
/etc/rabbitmq/[rabbitmq-env.conf]
```
default bind 0.0.0.0 with `guest` only allowed on `127.0.0.1` see [more details](https://www.rabbitmq.com/configure.html)

Use `sudo service rabbitmq-server reload/restart` to reload the configure/restart the message queue.