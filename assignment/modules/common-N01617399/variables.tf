variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type    = string
  default = "N01617399-logs"
}

variable "recovery_services_vault_name" {
  type    = string
  default = "N01617399-recovery"
}

variable "storage_account_name" {
  type    = string
  default = "n01617399sa"
}
variable "common_tags" {

}
