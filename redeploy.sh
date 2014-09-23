#!/bin/bash
#delete the current deployment
gcloud preview deployment-manager deployments --region europe-west1 delete mpi_cluster_v1_deployment
gcloud preview deployment-manager templates delete mpi_cluster_v1
#create the new template
gcloud preview deployment-manager templates create --template-file mpi-cluster-config.yaml mpi_cluster_v1
#create the new deployment
gcloud preview deployment-manager deployments --region europe-west1 create --template mpi_cluster_v1 mpi_cluster_v1_deployment

