Docker setup for Symfony 4 development
==============


[![Build Status](https://secure.travis-ci.org/jimigrunge/dockerize-symfony-4y.png?branch=master)](http://travis-ci.org/jimigrunge/dockerize-symfony-4)

# Prerequisites

[Docker](https://www.docker.com/)

[Docker-sync](http://docker-sync.io/)

# Installation

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
./vessel start
```




Make sure you adjust `database_host` in `parameters.yml` to the database container alias "db"

Then, run:

```bash
$ docker-compose up
```




