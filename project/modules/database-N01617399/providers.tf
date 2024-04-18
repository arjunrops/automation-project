# provider "azurerm" {
#   features {}
# }
# # provider "azurerm" {
# #   features {}
# #   #subscription_id = "0ddca09f-9bb6-4fef-b584-7c861c4fa55f"
# #   subscription_id = "4e3a143e-0fd2-431c-a1e5-fc4b2d82c778"
# # }
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
