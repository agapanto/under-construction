#!/bin/bash
source scripts/load-env-file.sh

ENV_FILE=$1
HELM_BINARY=$2
HELM_TEMPLATE=$3
IMAGE_REGISTRY=$4
IMAGE_NAME=$5
IMAGE_VERSION=$6

load_env_file

${HELM_BINARY} upgrade ${IMAGE_NAME} ${HELM_TEMPLATE} \
  --set image.repository=${IMAGE_REGISTRY}/${IMAGE_NAME} \
  --set image.tag=${IMAGE_VERSION} \
  --set service.type=NodePort
