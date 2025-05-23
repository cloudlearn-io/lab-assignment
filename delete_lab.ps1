# Set variables


# param(
#     [Parameter(Mandatory=$true)]
#     [string]$ResourceGroup
# )

# $PolicyName = "AzureLabPolicy-$ResourceGroup"
# $RoleName = "AzureLabRole-$ResourceGroup"

# Write-Host "🧹 Starting cleanup for resource group: $ResourceGroup"

# # Delete policy assignment
# Write-Host "🗑️  Deleting policy assignment..."
# az policy assignment delete `
#     --name $PolicyName `
#     --resource-group $ResourceGroup

# # Delete policy definition
# Write-Host "🗑️  Deleting policy definition..."
# az policy definition delete `
#     --name $PolicyName

# # Delete role assignment
# Write-Host "🗑️  Deleting role assignment..."
# $currentUser = (az account show --query user.name -o tsv)
# az role assignment delete `
#     --assignee $currentUser `
#     --resource-group $ResourceGroup `
#     --role $RoleName

# # Delete role definition
# Write-Host "🗑️  Deleting role definition..."
# az role definition delete `
#     --name $RoleName `
#     --custom-role-only true

# # Delete all resources in the resource group
# Write-Host "🗑️  Deleting all resources in the resource group..."

# # Get all resources in the resource group
# # $resources = (az resource list --resource-group $ResourceGroup --query "[].id" -o tsv)

# # # Delete each resource
# # foreach ($resource in $resources) {
# #     Write-Host "Deleting resource: $resource"
# #     az resource delete --ids $resource --verbose
# # }

# # Cleanup temporary directory if it exists
# $TmpDir = "C:\temp\$ResourceGroup"
# if (Test-Path $TmpDir) {
#     Write-Host "🧹 Cleaning up temporary files..."
#     Remove-Item -Path $TmpDir -Recurse -Force
# }

# Write-Host "✅ Cleanup completed successfully."