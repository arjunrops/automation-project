variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "server_name" {
   #type = string
  # default = "postgress-N01617399"
  #default = "my-postgresql-server"
}

variable "administrator_login" {
  type = string
  default = "psqladmin"
}

variable "administrator_login_password" {
  default = "Chelsea@2021"
}

variable "sku_name" {
  default = "B_Gen5_1"
}

variable "db_version" {
  default = "11"
}
variable "storage_gb" {
  default = 32
}
variable "common_tags" {

}
