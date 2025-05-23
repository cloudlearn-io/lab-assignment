# Set variables
param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroup
)

$TemplateFile = "environment/template.json"
# $PolicyFile = "environment/securityPolicy.json"
# $PolicyName = "AzureLabPolicy-$ResourceGroup"
# $RoleName = "AzureLabRole-$ResourceGroup"
$DeploymentName = "TestDeployment"

# Create temporary directory
# $TmpDir = "C:\temp\$ResourceGroup"
# New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

# Write-Host "🚀 Starting lab deployment for resource group: $ResourceGroup"

# # Extract policy components
# Write-Host "📋 Extracting policy components..."
# $policyContent = Get-Content $PolicyFile | ConvertFrom-Json
# $policyContent.policyRule | ConvertTo-Json -Depth 10 | Set-Content "$TmpDir\policy.json"
# $policyContent.permissions | ConvertTo-Json -Depth 10 | Set-Content "$TmpDir\permissions.json"
# $policyContent.parameters | ConvertTo-Json -Depth 10 | Set-Content "$TmpDir\parameters.json"
# $policyContent.parameters_values | ConvertTo-Json -Depth 10 | Set-Content "$TmpDir\values.json"

# # Get resource group scope
# $ResourceGroupScope = (az group show --name $ResourceGroup --query id -o tsv)

# # Create role definition
# Write-Host "👤 Creating role definition..."
# $permissionsContent = Get-Content "$TmpDir\permissions.json" | ConvertFrom-Json
# $roleDefinition = @{
#     name = $RoleName
#     description = "Lab Role"
#     assignableScopes = @($ResourceGroupScope)
#     permissions = $permissionsContent[0]
# } | ConvertTo-Json -Depth 10
# Set-Content -Path "$TmpDir\role.json" -Value $roleDefinition

# # Create and assign role
# Write-Host "🔑 Creating and assigning role..."
# az role definition create --role-definition "$TmpDir\role.json"
# Start-Sleep -Seconds 30  # Wait for role propagation
# $currentUser = (az account show --query user.name -o tsv)
# az role assignment create `
#     --assignee $currentUser `
#     --role $RoleName `
#     --scope $ResourceGroupScope

# # Create policy definition
# Write-Host "📌 Creating policy definition..."
# $DefinitionId = (az policy definition create `
#     --name $PolicyName `
#     --display-name "Lab Policy" `
#     --description "Lab policy" `
#     --metadata "Category=Lab" `
#     --rules "$TmpDir\policy.json" `
#     --params "$TmpDir\parameters.json" `
#     --mode "All" `
#     --query "id" `
#     -o tsv)

# # Assign policy
# Write-Host "🔐 Assigning policy..."
# az policy assignment create `
#     --name $PolicyName `
#     --display-name "Lab Policy Assignment" `
#     --scope $ResourceGroupScope `
#     --policy $DefinitionId `
#     --params "$TmpDir\values.json"

# Deploy ARM template
Write-Host "�� Deploying template..."
az deployment group create `
    --name $DeploymentName `
    --resource-group $ResourceGroup `
    --template-file $TemplateFile `
    --output json

# Cleanup
# Write-Host "🧹 Cleaning up temporary files..."
# Remove-Item -Path $TmpDir -Recurse -Force

# Check result
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Deployment completed successfully."
} else {
    Write-Host "❌ Deployment failed. Please check error messages above."
}