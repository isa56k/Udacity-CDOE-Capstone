# Udacity-CDOE-Capstone
Udacity Cloud DevOps Engineer Capstone Proejct

This project use AWS ECR and EKS for the infrastructure.

To build out the required infrastructure run
./deploy.sh capstone IaC/capstone-ecr.yaml IaC/capstone-ecr-params.json

To Create the required K8s Cluster Run:
eksctl create cluster -f IaC/eks-cluster-config.yaml

Create the K8's Deployment:
kubectl apply -f IaC/k8s-deployment.yaml

Create the K8's Service:
kubectl apply -f IaC/k8s-service.yaml

To check URL for Webpage use:
kubectl get svc capstone-web

