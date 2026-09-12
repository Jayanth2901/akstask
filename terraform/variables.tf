variable "project_name" {
  description = "Project name"
  type        = string
  default     = "employee"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "employee-aks-rg"
}

variable "key_vault_name" {
  description = "Azure Key Vault name that stores MySQL credentials"
  type        = string
  default     = "employee-kv-2026"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "aks_subnet_prefix" {
  description = "AKS subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "appgw_subnet_prefix" {
  description = "Application Gateway subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "mysql_subnet_prefix" {
  description = "MySQL subnet CIDR"
  type        = string
  default     = "10.0.3.0/24"
}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name"
  type        = string
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "employee-aks"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_D2s_v5"
}

variable "mysql_database_name" {
  description = "MySQL database name"
  type        = string
  default     = "employee_db"
}
