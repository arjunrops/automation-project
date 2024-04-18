variable "common_tags" {
	
}
variable "subnet_id" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "windows_avs" {
  description = "Name of the Windows Availability Set"
  type        = string
}

variable "windows_name" {
  description = "Mapping of VM names to sizes for Windows VMs"
  type        = map(string)
}

variable "admin_username_windows" {
  type = string
}
variable "admin_password_windows" {
  type = string
}

variable "storage_account_type_windows" {
  type = string
}

variable "storage_disk_size_windows" {
  type = string
}

variable "storage_caching_windows" {
  type = string
}

variable "os_publisher_windows" {
  type = string
}

variable "os_offer_windows" {
  type = string
}

variable "os_sku_windows" {
  type = string
}

variable "os_version_windows" {
  type = string
}

variable "nb_count_windows" {
  description = "Number of instances in the availability set"
  type        = number
}

variable "boot_diagnostics_sa_endpoint" {
  type = string
}
