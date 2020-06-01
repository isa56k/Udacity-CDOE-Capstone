#!/bin/bash

# You need to pass in the Public SSH key for AWS
SSH_PUB_KEY="$1"

# Check that a pparameter has been passed in
if [ -z $1 ]; then 
    echo "You need to pass in the path to your Public SSH key for AWS"
    exit
fi   

# Create the cluster
echo "Creating EKS cluster..."
eksctl create cluster \
--name capstone-proj \
--version 1.16 \
--region us-east-2 \
--nodegroup-name standard-workers \
--node-type t3.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key $1 \
--managed

# Echo Done to user for completeness!
echo "Done!!"