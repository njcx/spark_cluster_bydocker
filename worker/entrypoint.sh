#!/bin/bash
set -e
set -u
set -x
sleep 3


/spark/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port 8080 -c $CORES -m $RAM spark://master:7077