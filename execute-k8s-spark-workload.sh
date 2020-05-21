#!/usr/bin/env bash
#
# Step_1 : Install spark-operator in kubernetes
# Step_2 : For spark-operator enable webhook
#
# helm uninstall spark-operator
#
./spark/install-spark-kubernetes-operator
./spark/create-spark-service-account
./spark/run-spark-pi-2k8s-pods
#
