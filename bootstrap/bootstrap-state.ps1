# HCTA-101: Bootstrap storage for Terraform remote state
# Run once. Everything after this is managed by Terraform.
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

$location = "australiaeast"
$rg = "rg-tfstate"
$sa = "sttfstatethanura01"
$container = "tfstate"

az group create --name $rg --location $location

az storage account create --name $sa --resource-group $rg --location $location --sku Standard_LRS --kind StorageV2 --min-tls-version TLS1_2 --allow-blob-public-access false --allow-shared-key-access false

$me =  az ad signed-in-user show --query id -o tsv
az storage account blob-service-properties update --account-name $sa --resource-group $rg --enable-versioning true
az role assignment create --assignee $me --role "Storage Blob Data Contributor" --scope $(az storage account show --name $sa --resource-group $rg --query id -o tsv)
az storage container create --name $container --account-name $sa --auth-mode login