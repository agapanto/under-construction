#!/bin/bash
source scripts/load-env-file.sh

ENV_FILE=$1
HELM_BINARY=$2
IMAGE_NAME=$3

load_env_file

${HELM_BINARY} del ${IMAGE_NAME}
