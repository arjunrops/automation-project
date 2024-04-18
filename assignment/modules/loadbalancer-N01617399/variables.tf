variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}
variable "lb_name" {
  type    = string
  default = "automation-lb"
}

variable "vm_nics" {
  #type = list(string)
  type = any
}


variable "common_tags" {

}

variable "linux_name" {
  
}