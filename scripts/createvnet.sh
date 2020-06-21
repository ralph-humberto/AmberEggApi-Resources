#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceVnetName=$2
resourceSubnetName=$3
resourceTags=$4

echo "$resourceGroupName: check if exists"
resourceGroupCheck=`az group list --query "[?name=='$resourceGroupName']"`

if [ ${#resourceGroupCheck} -lt 3 ]; then
    echo "Creating resource-group named $resourceGroupName with tags $resourceTags"
	az network vnet create -g resourceGroupName -n $resourceVnetName --address-prefix 10.0.0.0/16 \
		--subnet-name $resourceSubnetName --subnet-prefix 10.240.0.0/16 \
		--tags "$tags"
    echo "Resource group created successfully"
else
	echo "$resourceGroupName: already exists"
fi