#!/bin/bash
set -e
set -u
set -x

source script.env

docker build -t ${PREFIX}spark_common ./common/ --build-arg SPARK_COMMON=${PREFIX}spark_common
docker build -t ${PREFIX}spark_master ./master/ --build-arg SPARK_COMMON=${PREFIX}spark_common
docker build -t ${PREFIX}spark_worker ./worker/ --build-arg SPARK_COMMON=${PREFIX}spark_common
docker build -t ${PREFIX}livy ./livy/ --build-arg SPARK_COMMON=${PREFIX}spark_common
docker build -t ${PREFIX}notebook ./notebook/