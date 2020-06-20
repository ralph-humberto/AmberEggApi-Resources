#!/bin/bash

resourceGroupName="rs-gp-dev-001"
kuberneteServiceName="aks-dev-001"

echo "$kuberneteServiceName: check if exists"
kuberneteServiceCheck=`az aks list --query "[?name=='$kuberneteServiceName']"`

if [ ${#kuberneteServiceCheck} -gt 2 ]; then
    echo "$kuberneteServiceName: removing..."
    az aks delete --name $resourceGroupName --yes
    echo "$kuberneteServiceName: removed successfully"
else
	echo "$kuberneteServiceName: not exists"
fi

echo "$resourceGroupName: check if exists"
resourceGroupCheck=`az group list --query "[?name=='$resourceGroupName']"`

if [ ${#resourceGroupCheck} -gt 2 ]; then
    echo "$resourceGroupName: removing..."
    az group delete --name $resourceGroupName --yes
    echo "$resourceGroupName: removed successfully"
else
	echo "$resourceGroupName: not exists"
fi