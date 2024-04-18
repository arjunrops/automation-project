output "vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}


output "subnet_name" {
  value = azurerm_subnet.network-subnet.name
}
output "subnet_id" {
  value = azurerm_subnet.network-subnet.id
}

output "subnet_address_prefix" {
  value = azurerm_subnet.network-subnet.address_prefixes
}


output "nsg_name" {
  value = azurerm_network_security_group.network-nsg.name
}
