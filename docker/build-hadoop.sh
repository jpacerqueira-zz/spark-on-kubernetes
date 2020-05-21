#!/bin/bash
##
set -e

HADOOP_VER=3.2.1
REPO_NAME=jpacerqueira83

# Build docker image.
docker build --build-arg HADOOP_VERSION=$HADOOP_VER -t  $REPO_NAME/hadoop-k8s:$HADOOP_VER  -f ./hadoop.Dockerfile .

# Push to docker repository.
docker push $REPO_NAME/hadoop-k8s:$HADOOP_VER
#
