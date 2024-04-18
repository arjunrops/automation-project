variable "location" {
  type = string
}
variable "resource_group" {
  type = string
}
variable "disk_count" {
  type = number
}
variable "vm_ids" {
  type = list(string)
}

variable "data_disk_size" {
  default = 10
}


variable "data_disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "data_disk_create_option" {
  type    = string
  default = "Empty"
}

variable "data_disk_caching" {
  type    = string
  default = "ReadWrite"
}
variable "common_tags" {

}
