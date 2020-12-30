#!/bin/zsh

DOCKER_NAME=healthdatadb
DB_HOST_PORT=25432

DB_PATH=$(pwd)/db

docker run \
    --restart unless-stopped \
    --name ${DOCKER_NAME} \
    -p ${DB_HOST_PORT}:5432 \
    -v ${DB_PATH}:/var/lib/postgresql/data \
    --user $(id -u):$(id -g) \
    -d \
    healthdata/pgdb

exit 0
