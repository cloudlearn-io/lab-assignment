#!/bin/bash

# Set variables
RESOURCE_GROUP="$1"
TEMPLATE_FILE="environment/template.json"
# POLICY_FILE="environment/securityPolicy.json"
# POLICY_NAME="AzureLabPolicy-$RESOURCE_GROUP"
# ROLE_NAME="AzureLabRole-$RESOURCE_GROUP"
DEPLOYMENT_NAME="TestDeployment"

# Create temporary directory
# TMP_DIR="/tmp/$RESOURCE_GROUP"
# mkdir -p "$TMP_DIR"

# Ensure resource group argument is provided
if [ -z "$RESOURCE_GROUP" ]; then
  echo "❌ Error: Please provide the resource group name as the first argument."
  echo "Usage: ./deploy_lab.sh <ResourceGroupName>"
  exit 1
fi

echo "🚀 Starting lab deployment for resource group: $RESOURCE_GROUP"

# Create resource group
# echo "📦 Creating resource group..."
# az group create --name "$RESOURCE_GROUP" --location "westus"

# Extract policy components
# echo "📋 Extracting policy components..."
# jq ".policyRule" < "$POLICY_FILE" > "$TMP_DIR/policy.json"
# jq ".permissions" < "$POLICY_FILE" > "$TMP_DIR/permissions.json"
# jq ".parameters" < "$POLICY_FILE" > "$TMP_DIR/parameters.json"
# jq ".parameters_values" < "$POLICY_FILE" > "$TMP_DIR/values.json"

# # Get resource group scope
# RESOURCE_GROUP_SCOPE=$(az group show --name "$RESOURCE_GROUP" -o tsv --query id)

# # Create role definition
# echo "👤 Creating role definition..."
# jq --arg n "$ROLE_NAME" \
#    --arg d "Lab Role" \
#    --arg s "$RESOURCE_GROUP_SCOPE" \
#    '.[0] + {name:$n,description:$d,assignableScopes:[$s]}' \
#    < "$TMP_DIR/permissions.json" \
#    > "$TMP_DIR/role.json"

# # Create and assign role
# echo "🔑 Creating and assigning role..."
# az role definition create --role-definition "$TMP_DIR/role.json"
# sleep 30  # Wait for role propagation
# az role assignment create \
#   --assignee "$(az account show --query user.name -o tsv)" \
#   --role "$ROLE_NAME" \
#   --scope "$RESOURCE_GROUP_SCOPE"

# # Create policy definition
# echo "📌 Creating policy definition..."
# DEFINITION_ID=$(az policy definition create \
#   --name "$POLICY_NAME" \
#   --display-name "Lab Policy" \
#   --description "Lab policy" \
#   --metadata "Category=Lab" \
#   --rules "$TMP_DIR/policy.json" \
#   --params "$TMP_DIR/parameters.json" \
#   --mode "All" \
#   -o tsv --query "id")

# # Assign policy
# echo "🔐 Assigning policy..."
# az policy assignment create \
#   --name "$POLICY_NAME" \
#   --display-name "Lab Policy Assignment" \
#   --scope "$RESOURCE_GROUP_SCOPE" \
#   --policy "$DEFINITION_ID" \
#   --params "$TMP_DIR/values.json"

# Deploy ARM template
echo "📦 Deploying template..."
az deployment group create \
  --name "$DEPLOYMENT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --template-file "$TEMPLATE_FILE" \
  --output json

# Cleanup
# echo "🧹 Cleaning up temporary files..."
# rm -rf "$TMP_DIR"

# Check result
if [ $? -eq 0 ]; then
  echo "✅ Deployment completed successfully."
else
  echo "❌ Deployment failed. Please check error messages above."
fi