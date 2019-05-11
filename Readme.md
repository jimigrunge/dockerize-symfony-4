Docker setup for Symfony 4 development
==============


[![Build Status](https://secure.travis-ci.org/jimigrunge/dockerize-symfony-4y.png?branch=master)](http://travis-ci.org/jimigrunge/dockerize-symfony-4)

## Prerequisites

[Docker](https://www.docker.com/)

[Docker-sync](http://docker-sync.io/)


## General disclaimer

**Do not use on production.** This image is meant to be use for development purposes only, the use of it on a production environment is all up to your entire responsibility.

## Includes

- PHP-FPM
- MySQL
- Nginx
- Redis
- MailHog
- Elasticsearch


## Installation

First, clone this repository:

```bash
$ git clone https://github.com/jimigrunge/dockerize-symfony-4)
```

Next, remove the `dockerize-symfony-4/.git/` control directory.

```
$ rm -rf .git/
```

Copy files to your project

```
$ cp -r dockerize-symfony-4/* base/directory/of/your/project/
```

Now move to your projects dierectory

```
$ cd base/directory/of/your/project/

```

Run the initialization command to set up nessesary files

```
$ docker/config.sh
```

You are now ready to start up the docker image

```
$ ./vessel start
```

Check to see that everything started correctly 

```
$ ./vessel ps

           Name                          Command               State                             Ports
--------------------------------------------------------------------------------------------------------------------------------
symfony4-01_app_1             start-container                  Up       0.0.0.0:80->80/tcp
symfony4-01_elasticsearch_1   /usr/local/bin/docker-entr ...   Up       0.0.0.0:9200->9200/tcp, 9300/tcp, 0.0.0.0:9600->9600/tcp
symfony4-01_mailhog_1         MailHog                          Up       1025/tcp, 0.0.0.0:8025->8025/tcp
symfony4-01_mysql_1           docker-entrypoint.sh mysqld      Up       0.0.0.0:3306->3306/tcp, 33060/tcp
symfony4-01_node_1            node                             Exit 0
symfony4-01_redis_1           docker-entrypoint.sh redis ...   Up       6379/tcp


```




