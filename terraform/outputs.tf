output "resource_group_name" {
  description = "Resource_group_name"
  value       = module.resource_group.name
}

output "vnet_name" {
  description = "Virtual network name"
  value       = module.networking.vnet_name
}

output "acr_name" {
  description = "ACR name"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "ACR login server — use this to tag and push Docker images"
  value       = module.acr.login_server
}

output "aks_name" {
  description = "AKS cluster name"
  value       = module.aks.aks_name
}

output "aks_kubelet_identity_object_id" {
  description = "AKS kubelet identity object ID"
  value       = module.aks.kubelet_identity_object_id
}

output "mysql_fqdn" {
  description = "MySQL Flexible Server FQDN"
  value       = module.mysql.fqdn
}

output "mysql_database_name" {
  description = "MySQL database name"
  value       = module.mysql.database_name
}

output "appgw_public_ip" {
  description = "Application Gateway public IP — this is your application URL"
  value       = module.application_gateway.public_ip_address
}
