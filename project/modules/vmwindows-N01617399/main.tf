resource "azurerm_availability_set" "windows_avs" {
  name                         = "windows-avs"
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.common_tags
}

resource "azurerm_windows_virtual_machine" "vm-windows" {
  for_each              = var.windows_name
  name                  = each.key
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = each.value
  admin_username        = var.admin_username_windows
  network_interface_ids = [azurerm_network_interface.vm-windows-nic[each.key].id]
  admin_password        = var.admin_password_windows
  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.storage_caching_windows
    storage_account_type = var.storage_account_type_windows
    disk_size_gb         = var.storage_disk_size_windows
  }
  source_image_reference {
    publisher = var.os_publisher_windows
    offer     = var.os_offer_windows
    sku       = var.os_sku_windows
    version   = var.os_version_windows
  }
  availability_set_id = azurerm_availability_set.windows_avs.id
  tags                = var.common_tags

  winrm_listener {
    protocol = "Http"
  }
  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_sa_endpoint
  }
}

resource "azurerm_network_interface" "vm-windows-nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.common_tags
}

resource "azurerm_public_ip" "vm-windows-pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = "${each.key}-pip"
  tags                = var.common_tags
}
