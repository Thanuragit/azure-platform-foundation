output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "subnet_app_id" {
  description = "ID of the app subnet."
  value       = azurerm_subnet.app.id
}

output "nsg_app_id" {
  description = "ID of the app subnet NSG."
  value       = azurerm_network_security_group.app.id
}