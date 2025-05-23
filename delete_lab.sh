## DONT USE THIS SCRIPT


#!/bin/bash

# Set variables
# RESOURCE_GROUP="$1"
# POLICY_NAME="AzureLabPolicy-$RESOURCE_GROUP"
# ROLE_NAME="AzureLabRole-$RESOURCE_GROUP"

# # Ensure resource group argument is provided
# if [ -z "$RESOURCE_GROUP" ]; then
#   echo "❌ Error: Please provide the resource group name as the first argument."
#   echo "Usage: ./cleanup_lab.sh <ResourceGroupName>"
#   exit 1
# fi

# echo "🧹 Starting cleanup for resource group: $RESOURCE_GROUP"

# # Delete policy assignment
# echo "🗑️  Deleting policy assignment..."
# az policy assignment delete \
#   --name "$POLICY_NAME" \
#   --resource-group "$RESOURCE_GROUP"

# # Delete policy definition
# echo "🗑️  Deleting policy definition..."
# az policy definition delete \
#   --name "$POLICY_NAME"

# # Delete role assignment
# echo "🗑️  Deleting role assignment..."
# az role assignment delete \
#   --assignee "$(az account show --query user.name -o tsv)" \
#   --resource-group "$RESOURCE_GROUP" \
#   --role "$ROLE_NAME"

# # Delete role definition
# echo "🗑️  Deleting role definition..."
# az role definition delete \
#   --name "$ROLE_NAME" \
#   --custom-role-only true

# Delete all resources in the resource group
# echo "🗑️  Deleting all resources in the resource group..."
# # Get all resources in the resource group
# RESOURCES=$(az resource list --resource-group "$RESOURCE_GROUP" --query "[].id" -o tsv)

# # Delete each resource
# for RESOURCE in $RESOURCES; do
#   echo "Deleting resource: $RESOURCE"
#   az resource delete --ids "$RESOURCE" --verbose
# done

# Cleanup temporary directory if it exists
# TMP_DIR="/tmp/$RESOURCE_GROUP"
# if [ -d "$TMP_DIR" ]; then
#   echo "🧹 Cleaning up temporary files..."
#   rm -rf "$TMP_DIR"
# fi

# echo "✅ Cleanup completed successfully."