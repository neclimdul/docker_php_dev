#!/bin/bash
export PHP_TAG=${PHP_TAG:-"7.0"}
export DOCUMENT_ROOT=${DOCUMENT_ROOT:-"/var/www/html"}
export NGINX_DIR=${NGINX_DIR:-"/etc/nginx"}
export MYSQL_DATA=${MYSQL_DATA:-"/var/lib/mysql"}
export MYSQL_SOCKET=${MYSQL_SOCKET:-"/var/run/mysqld"}
export SOLR_DATA=${SOLR_DATA:-"/opt/solr/data"}
export SOLR_CONFIG=${SOLR_CONFIG:-"/opt/solr/conf"}

COMPOSE="docker-compose -f docker-compose.yml"

while [[ $# -ge 1 ]]; do
    key="$1"
    case $key in
        -b|--build)
        $COMPOSE build
        ;;

        -p|--pull)
        $COMPOSE pull
        ;;
    esac
    shift # past argument or value
done
$COMPOSE up
