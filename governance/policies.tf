# 1. FIND the built-in ISM initiative (it already exists in Azure)
data "azurerm_policy_set_definition" "ism-baseline" {
  display_name = "Australian Government ISM PROTECTED"

}
# 2. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "hcta-ism-baseline" {
  name                 = "HCTA-Ism-Baseline"
  policy_definition_id = data.azurerm_policy_set_definition.ism-baseline.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}

# 3. FIND the built-in Allowed locations policy (it already exists in Azure)
data "azurerm_policy_definition_built_in" "allowed-locations" {
  display_name = "Allowed locations"
}

# 4. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "hcta-allowed-locations" {
  name                 = "HCTA-Allowed-locations"
  policy_definition_id = data.azurerm_policy_definition_built_in.allowed-locations.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}

# 5. FIND the built-in equire a tag on resources policy (it already exists in Azure)
data "azurerm_policy_definition_built_in" "require-tag" {
  display_name = "Require a tag on resources"
}

# 6. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "htca-require-tag" {
  name                 = "HCTA-Required-Tag"
  policy_definition_id = data.azurerm_policy_definition_built_in.require-tag.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}

# 7. FIND the built-in Network interfaces should not have public IPs policy (it already exists in Azure)
data "azurerm_policy_definition_built_in" "nic-no-pip" {
  display_name = "Network interfaces should not have public IPs"
}

# 8. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "hcta-nic-no-pip" {
  name                 = "HCTA-No-PIP-on-NIC"
  policy_definition_id = data.azurerm_policy_definition_built_in.nic-no-pip.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}

# 9. FIND the built-in Storage account public access should be disallowed policy (it already exists in Azure)
data "azurerm_policy_definition_built_in" "stg-no-pubaccess" {
  display_name = "Storage account public access should be disallowed"
}

# 10. ASSIGN it to the HCTA MGT Group
resource "azurerm_management_group_policy_assignment" "hcta-stg-no-pubaccess" {
  name                 = "HCTA-Deny-Stg-PubAccess"
  policy_definition_id = data.azurerm_policy_definition_built_in.stg-no-pubaccess.id
  management_group_id  = data.azurerm_management_group.hcta.id
  enforce              = false
  location             = "australiaeast"

  identity {
    type = "SystemAssigned"
  }
}