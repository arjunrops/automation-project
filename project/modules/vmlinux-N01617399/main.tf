resource "azurerm_network_interface" "vm-linux-nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index + 1}"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = element(azurerm_public_ip.vm-linux-pip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.common_tags
}

resource "azurerm_public_ip" "vm-linux-pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = "${var.linux_name}${count.index}"
  tags                = var.common_tags
}


resource "azurerm_linux_virtual_machine" "vm-linux" {
  count                 = var.nb_count
  name                  = "${var.linux_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = var.size
  admin_username        = var.admin_username
  network_interface_ids = [element(azurerm_network_interface.vm-linux-nic[*].id, count.index + 1)]

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_sa_endpoint
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk-${count.index + 1}"
    caching              = var.storage_caching
    storage_account_type = var.storage_account_type
    disk_size_gb         = var.storage_disk_size
  }
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  availability_set_id = azurerm_availability_set.avs.id
  tags                = var.common_tags
}


resource "azurerm_availability_set" "avs" {
  name                         = "${var.linux_name}-avs"
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.common_tags

}

resource "azurerm_virtual_machine_extension" "NetworkWatcherAgentLinux" {
  count                      = var.nb_count
  name                       = "NetworkWatcherAgentLinux-${count.index + 1}"
  virtual_machine_id         = element(azurerm_linux_virtual_machine.vm-linux[*].id, count.index + 1)
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_linux_virtual_machine.vm-linux]

}

resource "azurerm_virtual_machine_extension" "AzureMonitorLinuxAgent" {
  count                      = var.nb_count
  name                       = "AzureMonitorLinuxAgent-${count.index + 1}"
  publisher                  = "Microsoft.Azure.Monitor"
  type_handler_version       = "1.0"
  virtual_machine_id         = element(azurerm_linux_virtual_machine.vm-linux[*].id, count.index + 1)
  type                       = "AzureMonitorLinuxAgent"
  auto_upgrade_minor_version = true
  depends_on                 = [azurerm_linux_virtual_machine.vm-linux]
}
