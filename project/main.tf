
module "resource_groups" {
  source      = "./modules/rgroup-N01617399"
  location    = var.location
  common_tags = local.common_tags
}

module "network" {
  source                        = "./modules/network-N01617399"
  virtual_network_address_space = var.virtual_network_address_space
  virtual_network_name          = var.virtual_network_name
  subnet_name                   = var.subnet1_name
  subnet_address_space          = var.subnet1_address_space
  location                      = var.location
  rg_name                       = module.resource_groups.rg_name
  nsg_name                      = var.nsg1_name
  common_tags                   = local.common_tags
}

module "common" {
  source      = "./modules/common-N01617399"
  rg_name     = module.resource_groups.rg_name
  location    = var.location
  common_tags = local.common_tags
}

module "vmlinux" {
  source                       = "./modules/vmlinux-N01617399"
  subnet_id                    = module.network.subnet_id
  rg_name                      = module.resource_groups.rg_name
  location                     = var.location
  linux_name                   = var.linux_name
  size                         = var.size
  admin_username               = var.admin_username
  public_key                   = var.public_key
  storage_account_type         = var.storage_account_type
  storage_disk_size            = var.storage_disk_size
  storage_caching              = var.storage_caching
  linux_avs                    = var.linux_avs
  nb_count                     = 3
  boot_diagnostics_sa_endpoint = module.common.storage_account_endpoint
  common_tags                  = local.common_tags

}

# module "vmwindows" {
#   source                       = "./modules/vmwindows-N01617399"
#   subnet_id                    = module.network.subnet_id
#   rg_name                      = module.resource_groups.rg_name
#   location                     = var.location
#   windows_name                 = var.windows_name
#   windows_avs                  = var.windows_avs
#   admin_username_windows       = var.admin_username_windows
#   admin_password_windows       = var.admin_password_windows
#   storage_account_type_windows = var.storage_account_type_windows
#   storage_disk_size_windows    = var.storage_disk_size_windows
#   storage_caching_windows      = var.storage_caching_windows
#   os_publisher_windows         = var.os_publisher_windows
#   os_offer_windows             = var.os_offer_windows
#   os_sku_windows               = var.os_sku_windows
#   os_version_windows           = var.os_version_windows
#   nb_count_windows             = 1
#   boot_diagnostics_sa_endpoint = module.common.storage_account_endpoint
#   common_tags                  = local.common_tags
# }

# module "data_disk" {
#   source         = "./modules/datadisk-N01617399"
#   disk_count     = 4
#   location       = var.location
#   resource_group = module.resource_groups.rg_name
#   vm_ids         = concat(module.vmlinux.vm_ids, module.vmwindows.windows_vm_ids)
#   common_tags    = local.common_tags
# }

module "data_disk" {
  source         = "./modules/datadisk-N01617399"
  disk_count     = 3
  location       = var.location
  resource_group = module.resource_groups.rg_name
  vm_ids         = concat(module.vmlinux.vm_ids)
  common_tags    = local.common_tags
}

module "load_balancer" {
  source         = "./modules/loadbalancer-N01617399"
  location       = var.location
  resource_group = module.resource_groups.rg_name
  vm_nics        = module.vmlinux.nic_id
  common_tags    = local.common_tags
  linux_name = var.linux_name
}


# module "postgresql_server" {
#   source         = "./modules/database-N01617399"
#   resource_group = module.resource_groups.rg_name
#   location       = var.location
#   common_tags    = local.common_tags
#   server_name    = "postgres-n01617399"  
# }

