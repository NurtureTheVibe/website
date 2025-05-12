terraform {
  required_version = ">= 1.8"

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatevibeprod"
    container_name       = "tfstate"
    key                  = "website-infra.tfstate"
  }
}
