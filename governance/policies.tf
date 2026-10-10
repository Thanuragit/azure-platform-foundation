# 1. FIND the built-in ISM initiative (it already exists in Azure)
data "azurerm_policy_set_definition" "ism-baseline" {
  display_name = "Australian Government ISM PROTECTED"

}
# 2. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "ism-assignment" {
  name                 = "ism-assignment"
  policy_definition_id = data.azurerm_policy_set_definition.ism-baseline.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}
