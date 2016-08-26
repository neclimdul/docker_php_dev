# docker_php_dev
Docker compose files to spin up a quick PHP development environment.

## Usage
Connecting all the pieces to get a development environment running in docker can be tricky. The goal of this repo is to provide a docker compose setup that can quickly emulate a LEMP development environment running locally on your machine.

There various ways you can use the compose file but assuming you are going to run it locally you'll first need to install the docker engine on your machine.
https://www.docker.com/products/overview

Next you'll need to grab docker-compose https://docs.docker.com/compose/install/

Next its as almost as easy as running `docker-compose -f docker-compose.yml up` expect we'll need to tell it where to store and find some persistent files on your machine. You will need to provide some environment variables to the script to make it work though.

And example script is provided in `start.sh` which sets some sane defaults on a Ubuntu operating system.

## Environment variables
### PHP_TAG
This tells which version of php to use. Currently supported versions are "5.6" and "7.0".

### DOCUMENT_ROOT
This is the directory containing your PHP and static files. It will be mounted to `/var/www/html/` in Nginx and the FPM containers.

### NGINX_DIR
This directory contains configuration files for nginx. You can fully customize the way Nginx runs to support various applications and also support various virtual hosts.

### MYSQL_DATA
This directory will contain all your databases created in mysql. If you don't have an existing data directory you're importing all the files will be created and initialized using the logic of the mariadb and the environment variables stored in `mysql.env`
https://hub.docker.com/_/mariadb/

### MYSQL_SOCKET
Connecting to the mysql port can be problematic. This provides a location where the socket file can be stored and provides a way to directly connect to the server and run queries.

## Notes
### Rebuilding the FPM container
The first time you run each version PHP a container will be built. However you'll probably want to rebuild it from time to time to get the latest version of php, etc. To do this you will need to provide all you environment variables and run `docker-composer -f docker-compose.yml build`

### Configuring PHP
If you need to configure some php settings specific to your environment you can edit the conf/php.ini file in either taged directory and rebuild the container. The updated file will then be used by php in your container going forward.
