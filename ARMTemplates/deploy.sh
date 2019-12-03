#!/bin/bash

# Login to Azure - Commented out for convenience
#az login

# Show Azure Subscription Table
az account list --out table

# Azure general variables, if set it will not prompt 
SUBSCRIPTION_ID=""
RESOURCE_GROUP_NAME=""
LOCATION=""
# ARTIFACTS_STORAGE_ACCOUNT_NAME="artifactssa$RANDOM"
# ARTIFACTS_CONTAINER_NAME="artifacts"

if [[ ! $SUBSCRIPTION_ID ]]
then
    echo -n "Enter your Azure Subscription ID: "
    read SUBSCRIPTION_ID
fi

if [[ ! $RESOURCE_GROUP_NAME ]] 
then
    echo -n "Enter your Resource Group Name: "
    read RESOURCE_GROUP_NAME
fi

if [[ ! $LOCATION ]] 
then
    echo -n "Enter your Location: "
    read LOCATION
fi

az account set --subscription $SUBSCRIPTION_ID
RG_EXISTS=$(az group list --query "length([?name=='$RESOURCE_GROUP_NAME'])")

if [ $RG_EXISTS -eq 0 ]
then
    az group create --location $LOCATION --name $RESOURCE_GROUP_NAME
fi

## Create Artifacts Storage Account
# SA_EXISTS=$(az storage account list --resource-group $RESOURCE_GROUP_NAME --query "length([?name=='$ARTIFACTS_STORAGE_ACCOUNT_NAME'])")

# if [ $SA_EXISTS -eq 0 ]
# then
#     az storage account create --name $ARTIFACTS_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME

#     az storage container create --name $ARTIFACTS_CONTAINER_NAME --account-name $ARTIFACTS_STORAGE_ACCOUNT_NAME
# fi

# ARTIFACTS_URL=$(az storage account show --resource-group $RESOURCE_GROUP_NAME --name $ARTIFACTS_STORAGE_ACCOUNT_NAME --query "primaryEndpoints.blob" --output tsv)

# end=$(date -u -d "3 hours" '+%Y-%m-%dT%H:%MZ')
# ARTIFACTS_SAS_TOKEN=$(az storage container generate-sas -n $ARTIFACTS_CONTAINER_NAME --account-name $ARTIFACTS_STORAGE_ACCOUNT_NAME --https-only --permissions dlrw --expiry $end -o tsv)

# # uploading all templates in the nestedTemplates folder. 
# for file in ./nestedTemplates/*
# do
#     az storage blob upload -n $file -f $file -c $ARTIFACTS_CONTAINER_NAME --account-name $ARTIFACTS_STORAGE_ACCOUNT_NAME --sas-token $ARTIFACTS_SAS_TOKEN
# done


## Deploy to Azure using parameters.json
az group deployment create -g $RESOURCE_GROUP_NAME \
        --template-file azuredeploy.json \
        --parameters azuredeploy.parameters.json 

## In case an Artifact location is required for Nested Templates. 

# az group deployment create -g $RESOURCE_GROUP_NAME \
#         --template-file azuredeploy.json \
#         --parameters azuredeploy.parameters.json \
#         --parameters _artifactsLocation="$ARTIFACTS_URL$ARTIFACTS_CONTAINER_NAME/" _artifactsLocationSasToken="?$ARTIFACTS_SAS_TOKEN"
