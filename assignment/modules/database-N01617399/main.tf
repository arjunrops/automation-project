resource "azurerm_resource_group" "postgresql_rg" {
  name     = "postgresql-server" 
  location = var.location        
}


resource "azurerm_postgresql_server" "postgresql_server" {
  #name                          = var.server_name
  name                          = "my-postgresql-server7399"
  location                      = var.location
  resource_group_name           = var.resource_group
  #resource_group_name           = "postgresql-server"
  sku_name                      = var.sku_name
  version                       = var.db_version
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  public_network_access_enabled = true
  ssl_enforcement_enabled       = true
  # storage_mb                    = var.storage_gb
  tags                          = var.common_tags
}

output "instance_name" {
  value = azurerm_postgresql_server.postgresql_server.name
}
