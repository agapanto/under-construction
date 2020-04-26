#!/bin/bash
source scripts/load-env-file.sh

ENV_FILE=$1
IMAGE_TAG=$2

load_env_file

HOST_PORT=8080
NGINX_PORT=$PORT

docker run --rm -it \
-p $HOST_PORT:$NGINX_PORT \
--env-file $ENV_FILE \
--expose=$NGINX_PORT \
$IMAGE_TAG \
/bin/sh
