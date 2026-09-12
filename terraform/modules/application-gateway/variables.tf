variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "appgw_name" {
  description = "Application Gateway name"
  type        = string
}

variable "appgw_subnet_id" {
  description = "Application Gateway subnet ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}