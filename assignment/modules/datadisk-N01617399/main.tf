resource "azurerm_managed_disk" "data_disk" {
  count                = var.disk_count
  name                 = "datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = var.data_disk_type
  create_option        = var.data_disk_create_option
  disk_size_gb         = var.data_disk_size
  tags                 = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  count              = var.disk_count
  virtual_machine_id = element(var.vm_ids[*], count.index)
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  lun                = count.index
  caching            = var.data_disk_caching
}
