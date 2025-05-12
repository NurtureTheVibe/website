output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "dns_name_servers" {
  description = "NS records to delegate at your registrar"
  value       = azurerm_dns_zone.root.name_servers
}
