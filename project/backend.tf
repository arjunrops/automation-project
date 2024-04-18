terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01617399RG"
    storage_account_name = "ktfstaten01617399sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}