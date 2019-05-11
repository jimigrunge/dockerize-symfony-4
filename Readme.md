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

## Daily usage

### Start docker server

```
$ docker-sync clean
$ docker-sync start
$ ./vessel start
```

### SSH into server

```
$ ./vessel ssh app
```

### Stop server

```
$ ./vessel stop
$ docker-sync stop
```

### To view site: Open your browser to http://localhost

### Composer

Often you can run Composer directly as usual, but you can run them within Vessel as well. You can use vessel's `composer` command or `comp` command for short.

```
# Use composer
$ ./vessel composer <cmd>
$ ./vessel comp <cmd> # "comp" is a shortcut to "composer"
# Example
./vessel composer require aws/aws-sdk-php
```

### PHP

Ad-hoc PHP commands can be run within Vessel.

Just use the `php` command:

```
# List php CLI modules:
$ ./vessel php -m

# Echo "hello world"
$ ./vessel php -r "echo 'hello world';"

# Use artisan, because why not?
$ ./vessel php artisan list
```
### Testing

We can use Vessel to run our tests as well! This is especially useful if you test with your database or SQLite. Vessel has the `test` command to help us out here.

```
# Run phpunit tests
$ ./vessel test

$ ./vessel test --filter=some.phpunit.filter
$ ./vessel test tests/Unit/SpecificTest.php
```

### NodeJS/NPM/Yarn/Gulp

Vessel also builds a container with NodeJS, NPM, Yarn, and Gulp. This container isn't actively running but can be used whenever you like.

#### Node

Any Node command can be run, such as `node index.js`.

```
# Run nodejs
$ ./vessel node <cmd>
```

#### NPM

Any NPM command can be run, such as `npm install foo`.

```
# Run npm
$ ./vessel npm <cmd>

## Example: install deps
$ ./vessel npm install
```

#### Yarn

You may prefer to install and run tasks with Yarn.

```
$ ./vessel yarn <cmd>

## Example: install dependencies
$ ./vessel yarn install

## Watch for file changes
$ ./vessel yarn watch

## Run the dev task
$ ./vessel yarn run dev
```

#### Gulp

If you are using Gulp, you can continue to use that as well.
```
$ ./vessel gulp <cmd>
```

### MySQL

You'll likely find yourself needing to perform some MySQL operations.

####Log into MySQL

Vessel has a shortcut to allow you to log into MySQL. This will also run use `your_database`, where "your_database" is the database set by your `DB_DATABASE` environment variable.

> This requires the MySQL container to be running.

```
# Log into mysql
$ ./vessel mysql
```

#### Exporting the Database

Vessel has a shortcut to allow you to export the database configured in the `.env` file. This outputs to `stdout`; You'll need to redirect the output to a file on your local file system:

```
# Export the database and save it to example.sql
$ ./vessel dump > ~/Sites/example/example.sql

# Export the database, gzip it, save it to example.sql.gz
$ ./vessel dump | gzip > ~/Sites/example/example.sql.gz
```

### CLI

You can run other operations against the MySQL container as well. Here are some examples.

#### MySQL CLI

> This shows you how to use `exec` to run `mysql` commands against the database container. See the section above Log into MySQL to use the `./vessel mysql` command as a shortcut to logging in using the mysql client.

> This information below will let you do more complex `mysql` commands.

```
# Execute against the "mysql" container
# the command "mysql -u root -p".
# This will prompt you for the root password to login.
$ ./vessel exec mysql mysql -u root -p

# This is similar to the above command, but it spins up a new
# container rather than executes a command within a running
# container. This connects to mysql server at hostname `mysql`.
$ ./vessel run --rm \
    mysql \
    mysql -h mysql -u root -p
```

#### App Container CLI (Bash)

If you want to "log into" your application controller, you can run `bash` inside of it. This is just like SSHing into the application container, except we're just executing a `bash` process inside the already-running container.

```
$ ./vessel exec app bash
```

You'll be running as user root, and can poke around the container. Note that any changes you make will not persist when you stop and restart Vessel.

You can do the same for some of the other containers as well:

```
# Log into the mysql container
$ ./vessel exec mysql bash
```

Finally, you can use the `ssh` command shortcut as of version `3.1.0`:

```
$ ./vessel ssh app
$ ./vessel ssh mysql
```

This will use `bash` to "log into" either containers. Accessing the `node` container is not supported.

#### Redis CLI

You can poke around the instance of Redis using `redis-cli`:

```
$ ./vessel exec redis redis-cli
```






```

# Licence
This package is an open-sourced software licensed under the MIT license.























