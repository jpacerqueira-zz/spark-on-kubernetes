#!/bin/bash
##
#############################################################
## Setup of Terraform Plan and dependencies in EC2 instance
#############################################################
set -e
#
LOCAL_PEM=$1  ##example  ~/Documents/aws_keys/"gateway-aws-eks-eu1.pem"
EC2_MACHINE=$2 ###ubuntu@ec2-34-251-239-242.eu-west-1.compute.amazonaws.com
SETUP_SCRIPT=./setup-ec2-gateway-terraform.sh
EKS_SOURCE_TF=eks-cluster
HERE_TF=$(pwd)
EC2_HOME=/home/ubuntu
LOGIT=setup.log
REG_AWS=eu-west-1
###
export AWS_ACCESS_KEY_ID=$3
export AWS_SECRET_ACCESS_KEY=$4
export AWS_DEFAULT_REGION=$REG_AWS
#
ssh -i $LOCAL_PEM -t $EC2_MACHINE "sudo rm -rf $EC2_HOME/*"
scp -i $LOCAL_PEM  $SETUP_SCRIPT  $EC2_MACHINE:~
#
# Setup AWS EKS : Elastic Kubernetes Instance with default Hashicorp 3
#
ssh -i $LOCAL_PEM -t $EC2_MACHINE "sudo bash -x $SETUP_SCRIPT >> $LOGIT && mkdir -p $EC2_HOME/$EKS_SOURCE_TF >> $LOGIT"
################################################################################################################################################# ERRORS rsync key isssue  ## rsync -aPv — progress -e "ssh -i $LOCAL_PEM $EC2_MACHINE " $HERE_TF/$EKS_SOURCE_TF  $EC2_MACHINE:$EC2_HOME/$EKS_SOURCE_TF
scp -i $LOCAL_PEM $HERE_TF/$EKS_SOURCE_TF/*.* $EC2_MACHINE:$EC2_HOME/$EKS_SOURCE_TF 
#
################################################################################################################################################ ERRORS AWS_CLI blocked #ssh -i $LOCAL_PEM -t ${EC2_MACHINE} "source ${EC2_HOME}/.bashrc && cd $EC2_HOME/$EKS_SOURCE_TF && terraform init >> $LOGIT  && terraform apply  >> $LOGIT "
cd $HERE_TF/$EKS_SOURCE_TF && terraform init && terraform plan && terraform apply && aws eks --region $REG_AWS update-kubeconfig --name ${EKS_NAME} 
#
# Setup Spark Kubernetes Baremetal instances
echo "D_4_ it! "
#
