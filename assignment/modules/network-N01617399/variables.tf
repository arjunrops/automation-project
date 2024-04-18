variable "rg_name" {
  type = string
}
variable "location" {
  type    = string
  default = "CanadaCentral"
}
variable "virtual_network_name" {
  type    = string
  default = "N01617399-VNET"
}
variable "virtual_network_address_space" {
  type = list(string)
}
variable "subnet_name" {
  type    = string
  default = "N01617399-SUBNET"
}

variable "subnet_address_space" {
  type = list(string)
}

variable "nsg_name" {
  type = string
}

variable "common_tags" {

}
