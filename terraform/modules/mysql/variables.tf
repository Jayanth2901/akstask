variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "server_name" {
  description = "MySQL Flexible Server name"
  type        = string
}

variable "database_name" {
  description = "MySQL database name"
  type        = string
}

variable "admin_username" {
  description = "MySQL administrator username"
  type        = string
}

variable "admin_password" {
  description = "MySQL administrator password"
  type        = string
  sensitive   = true
}

variable "mysql_subnet_id" {
  description = "Delegated MySQL subnet ID"
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}