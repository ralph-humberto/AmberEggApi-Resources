#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceTags=AmberEggApi Dev KeepOnlineOnlyWorkTime
resourceGroupName=rs-gp-dev-001
resourceGroupLocation=eastus
containerRegistry=amberEggApiRegistry
#
# Create 
#
echo "Initializing variables to be used on script"




&& \
      az group create --name rs-gp-dev-001 --location eastus --tags $tags && \
      az acr create --resource-group rs-gp-dev-001 --name amberEggApiRegistry --sku Basic