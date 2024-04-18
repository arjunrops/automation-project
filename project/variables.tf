locals {
  common_tags = {
    "Assignment"     = "CCGC 5502 Automation Assignment"
    "Name"           = "arjun.roperia"
    "ExpirationDate" = "2024-12-31"
    "Environment"    = "Learning"
  }
}
variable "network_rg_name" {
  description = "Resource Group name for networking"
  default     = "network-rg"
}

variable "linux_rg_name" {
  description = "Resource Group name for Linux"
  default     = "linux-rg"
}

variable "windows_rg_name" {
  description = "Resource Group name for Windows"
  default     = "windows-rg"
}

# variable "server_name" {
#   type = string
#   #default = "postgress-N01617399"
# }

variable "location" {
  description = "Azure region for resource groups"
  default     = "CanadaCentral"
}

variable "rg_name" {
  type    = string
  default = "network-rg"
}
variable "virtual_network_name" {
  type    = string
  default = "network-vnet"
}
variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnet1_name" {
  type    = string
  default = "network-subnet1"
}
variable "subnet2_name" {
  type    = string
  default = "network-subnet2"
}
variable "subnet1_address_space" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}
variable "subnet2_address_space" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "nsg1_name" {
  type    = string
  default = "network-nsg1"
}
variable "nsg2_name" {
  type    = string
  default = "network-nsg2"
}

variable "linux_name" {
  type    = string
  default = "n01617399-u-vm1"
}
variable "size" {
  type    = string
  default = "Standard_B1s"
}
variable "admin_username" {
  type    = string
  default = "arjunN01617399"
}
variable "public_key" {
  type    = string
  default = "/home/arjunsinghroperia/.ssh/id_rsa.pub"
}
variable "storage_account_type" {
  type    = string
  default = "Premium_LRS"
}
variable "storage_disk_size" {
  type    = string
  default = "32"
}
variable "storage_caching" {
  type    = string
  default = "ReadWrite"
}
variable "os_publisher" {
  type    = string
  default = "Canonical"
}
variable "os_offer" {
  type    = string
  default = "UbuntuServer"
}
variable "os_sku" {
  type    = string
  default = "19.04"
}
variable "os_version" {
  type    = string
  default = "latest"
}

variable "linux_avs" {
  description = "Name of the Linux Availability Set"
  type        = string
  default     = "linux-avs"
}

variable "nb_count" {
  description = "Number of instances in the availability set"
  type        = number
  default     = 1
}


// Windows Vars
variable "windows_avs" {
  description = "Name of the Windows Availability Set"
  type        = string
  default     = "windows-avs"
}

variable "windows_name" {
  description = "Mapping of VM names to sizes for Windows VMs"
  type        = map(string)
  default = {
    "n01617399-w-vm1" = "Standard_B1s"
  }
}

variable "admin_username_windows" {
  type    = string
  default = "arjunN01617399"
}
variable "admin_password_windows" {
  type    = string
  default = "Chelsea@2021"
}

variable "storage_account_type_windows" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "storage_disk_size_windows" {
  type    = string
  default = "128"
}

variable "storage_caching_windows" {
  type    = string
  default = "ReadWrite"
}

variable "os_publisher_windows" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "os_offer_windows" {
  type    = string
  default = "WindowsServer"
}

variable "os_sku_windows" {
  type    = string
  default = "2016-Datacenter"
}

variable "os_version_windows" {
  type    = string
  default = "latest"
}

variable "nb_count_windows" {
  description = "Number of instances in the availability set"
  type        = number
  default     = 1
}
