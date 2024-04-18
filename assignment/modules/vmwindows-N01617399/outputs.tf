output "windows_availability_set_name" {
  value = azurerm_availability_set.windows_avs.name
}

output "windows_vm_hostname" {
  value = [for vm in azurerm_windows_virtual_machine.vm-windows : vm.name]
}

output "windows_private_ip_address" {
  value = [for nic in azurerm_network_interface.vm-windows-nic : nic.private_ip_address]
}

output "windows_public_ip_address" {
  value = [for pip in azurerm_public_ip.vm-windows-pip : pip.ip_address]
}


output "windows_vm_ids" {
  value = [for vm in azurerm_windows_virtual_machine.vm-windows : vm.id]
}
