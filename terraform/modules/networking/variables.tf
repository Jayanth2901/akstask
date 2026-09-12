variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
}

variable "aks_subnet_prefix" {
  description = "AKS subnet CIDR"
  type        = string
}

variable "appgw_subnet_prefix" {
  description = "Application Gateway subnet CIDR"
  type        = string
}

variable "mysql_subnet_prefix" {
  description = "MySQL subnet CIDR"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}