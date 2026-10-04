terraform {
  required_version = ">=1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.7"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatethanura01"
    container_name       = "tfstate"
    key                  = "prod/foundation.tfstate"
    use_azuread_auth     = true
  }
}