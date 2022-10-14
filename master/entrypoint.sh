#!/bin/bash
set -e
set -u
set -x


/spark/bin/spark-class org.apache.spark.deploy.master.Master --ip master --port 7077 --webui-port 8080