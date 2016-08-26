#!/bin/bash
export PHP_TAG=${PHP_TAG:-"7.0"}
export NGINX_HTML=${NGINX_HTML:-"/var/www/html"}
export NGINX_DIR=${NGINX_DIR:-"/etc/nginx"}
export MYSQL_DATA=${MYSQL_DATA:-"/var/lib/mysql"}
export MYSQL_SOCKET=${MYSQL_SOCKET:-"/var/run/mysqld"}

docker-compose -f docker-compose.yml up