terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "73950bf5-1ded-4cff-91b1-9f18babff8b7"
  features {}
}