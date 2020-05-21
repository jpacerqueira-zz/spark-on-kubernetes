#!/usr/bin/env bash
#
# build and load containers
# repo  https://hub.docker.com/repository/docker/gftjoao/spark-k8s

./build-hadoop.sh
./build-hive.sh
./build-spark-sh
./build-pyspark.sh
#
