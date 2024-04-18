output "linux_availability_set_name" {
  value = azurerm_availability_set.avs.name
}

output "private_ip_address" {
  value = azurerm_network_interface.vm-linux-nic[*].private_ip_address
}

output "public_ip_address" {
  value = azurerm_public_ip.vm-linux-pip[*].ip_address
}
output "nic_id" {
  value = azurerm_network_interface.vm-linux-nic[*].id
}
output "vm_hostname" {
  value = azurerm_linux_virtual_machine.vm-linux[*].name
}

output "vm_fqdn" {
  value = azurerm_linux_virtual_machine.vm-linux[*].public_ip_address
}

output "vm_ids" {
  value = azurerm_linux_virtual_machine.vm-linux[*].id
}
