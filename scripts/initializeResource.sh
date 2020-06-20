#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceTags="AmberEggApi Dev KeepOnlineOnlyWorkTime"
resourceGroupName=rs-gp-dev-001
resourceGroupLocation=eastus
resourceKubernetesName=aks-dev-001
#
# Create 
#
echo "Creating resource-group named $resourceGroupName with tags $resourceTags"
az group create --name $resourceGroupName --location eastus --tags $tags
echo "Resource group created successfully"

echo "Creating resource-kubernetes named $resourceKubernetesName with tags $resourceTags"
az aks create --resource-group $resourceGroupName --name $resourceKubernetesName --node-count 1 --enable-addons monitoring --generate-ssh-keys --tags $tags
echo "Resource kubernetes created successfully"