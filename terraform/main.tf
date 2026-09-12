locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

# Read MySQL credentials securely from Azure Key Vault
data "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "mysql_username" {
  name         = "mysql-admin-username"
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "mysql_password" {
  name         = "mysql-admin-password"
  key_vault_id = data.azurerm_key_vault.this.id
}

module "resource_group" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = "${var.project_name}-vnet"
  vnet_address_space  = var.vnet_address_space
  aks_subnet_prefix   = var.aks_subnet_prefix
  appgw_subnet_prefix = var.appgw_subnet_prefix
  mysql_subnet_prefix = var.mysql_subnet_prefix
  tags                = local.common_tags
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  acr_name            = var.acr_name
  tags                = local.common_tags
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  aks_name            = var.aks_name
  dns_prefix          = var.project_name
  node_count          = var.node_count
  vm_size             = var.vm_size
  aks_subnet_id       = module.networking.aks_subnet_id
  acr_id              = module.acr.acr_id
  tags                = local.common_tags
}

module "mysql" {
  source              = "./modules/mysql"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  server_name         = "${var.project_name}-mysql-${var.environment}"
  database_name       = var.mysql_database_name
  admin_username      = data.azurerm_key_vault_secret.mysql_username.value
  admin_password      = data.azurerm_key_vault_secret.mysql_password.value
  mysql_subnet_id     = module.networking.mysql_subnet_id
  vnet_id             = module.networking.vnet_id
  tags                = local.common_tags
}

module "application_gateway" {
  source              = "./modules/application-gateway"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  appgw_name          = "${var.project_name}-appgw"
  appgw_subnet_id     = module.networking.appgw_subnet_id
  tags                = local.common_tags
}
