resource "azurerm_private_dns_zone" "mysql" {
  name                = "private.mysql.database.azure.com"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql" {
  name                  = "${var.server_name}-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.mysql.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_id

  tags = var.tags
}

resource "azurerm_mysql_flexible_server" "this" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  version = "8.0.21"

  delegated_subnet_id = var.mysql_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.mysql.id

  sku_name = "B_Standard_B1ms"

  storage {
    size_gb = 20
  }

  backup_retention_days = 7

  tags = var.tags

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.mysql
  ]
}

resource "azurerm_mysql_flexible_database" "this" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name

  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}