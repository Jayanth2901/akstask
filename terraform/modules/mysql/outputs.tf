output "server_id" {
  description = "MySQL Flexible Server ID"
  value       = azurerm_mysql_flexible_server.this.id
}

output "server_name" {
  description = "MySQL Flexible Server name"
  value       = azurerm_mysql_flexible_server.this.name
}

output "fqdn" {
  description = "MySQL server FQDN"
  value       = azurerm_mysql_flexible_server.this.fqdn
}

output "database_name" {
  description = "MySQL database name"
  value       = azurerm_mysql_flexible_database.this.name
}