output "mg_hcta_id" {
  value = data.azurerm_management_group.hcta.id
}

output "mg_corp_id" {
  value = azurerm_management_group.corp.id
}

output "mg_online_id" {
  value = azurerm_management_group.online.id
}