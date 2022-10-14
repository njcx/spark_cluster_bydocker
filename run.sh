#!/bin/bash
set -e
set -u
set -x

ls $1 > /dev/null

source script.env

export CONFIG_NODES=$(cat $1 | jq -r ".nodes")
export CONFIG_RAM=$(cat $1 | jq -r ".ram")
export CONFIG_CORES=$(cat $1 | jq -r ".cores")

#docker-compose up --abort-on-container-exit --scale worker="$CONFIG_NODES"
#docker-compose rm -f

docker-compose up  --scale worker="$CONFIG_NODES" -d