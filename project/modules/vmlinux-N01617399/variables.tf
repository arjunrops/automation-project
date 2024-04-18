variable "common_tags" {

}
variable "boot_diagnostics_sa_endpoint" {
  type = string
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
variable "linux_name" {
  type = string
}
variable "size" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "public_key" {
  type = string
}
variable "storage_account_type" {
  type = string
}
variable "storage_disk_size" {
  type = string
}
variable "storage_caching" {
  type = string
}
variable "os_publisher" {
  type    = string
  default = "OpenLogic"
}
variable "os_offer" {
  type    = string
  default = "CentOS"
}
variable "os_sku" {
  type    = string
  default = "8_5-gen2"
}
variable "os_version" {
  type    = string
  default = "latest"
}

variable "linux_avs" {
  description = "Name of the Linux Availability Set"
  type        = string
}

variable "nb_count" {
  description = "Number of instances in the availability set"
  type        = number
}
