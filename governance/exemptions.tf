data "azurerm_resource_group" "network_watcher" {
  name = "NetworkWatcherRG"
}


resource "azurerm_resource_group_policy_exemption" "Exempt-hcta-require-tag" {
  for_each = azurerm_management_group_policy_assignment.hcta-require-tag

  name                 = "Exempt-hcta-require-tag-${each.key}"
  resource_group_id    = data.azurerm_resource_group.network_watcher.id
  policy_assignment_id = each.value.id
  exemption_category   = "Waiver"
  expires_on           = "2027-04-13T00:00:00Z"
  description          = "Network Watcher is created by Azure, not deployed via Terraform."
}

