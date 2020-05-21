#!/bin/bash
##
set -e

SPARK_BUILD_VER=2.4.5
REPO_NAME=jpacerqueira83

# Build docker image.
docker build --build-arg SPARK_VERSION=$SPARK_BUILD_VER -t $REPO_NAME/spark-k8s:$SPARK_BUILD_VER -f ./spark.Dockerfile .

# Push to docker repository.
docker push $REPO_NAME/spark-k8s:$SPARK_BUILD_VER
#
