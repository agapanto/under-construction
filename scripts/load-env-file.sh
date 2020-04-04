#!/bin/bash

# If .env file exists, export all it's content as env vars
load_env_file() {
  if [ -f $ENV_FILE ]; then
    set -a
    source $ENV_FILE
    set +a
  else
    echo "No $ENV_FILE file found" 1>&2
    return 1
  fi
}
