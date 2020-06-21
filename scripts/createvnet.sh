#!/bin/bash
#
# Initialize variables used on script
#
echo "Initializing variables to be used on script"
resourceGroupName=$1
resourceVnetName=$2
resourceSubnetName=$3
resourceTags=$4

echo "$resourceVnetName: check if exists"
resourceVnetCheck=`az vnet list --query "[?name=='$resourceVnetName']"`

if [ ${#resourceVnetCheck} -lt 3 ]; then
    echo "Creating vnet named $resourceVnetName with tags $resourceTags"
	az network vnet create -g resourceGroupName -n $resourceVnetName --address-prefix 10.0.0.0/16 \
		--subnet-name $resourceSubnetName --subnet-prefix 10.240.0.0/16 \
		--tags "$tags"
    echo "Vnet created successfully"
else
	echo "$resourceVnetName: already exists"
fi