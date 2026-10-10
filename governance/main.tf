# Top folder was created by hand (bootstrap); Terraform only reads it
data "azurerm_management_group" "hcta" {
  name = "mg-hcta"
}

# Level 1: under HCTA
resource "azurerm_management_group" "platform" {
  name                       = "mg-hcta-platform"
  display_name               = "Platform"
  parent_management_group_id = data.azurerm_management_group.hcta.id
}

resource "azurerm_management_group" "landingzones" {
  name                       = "mg-hcta-landingzones"
  display_name               = "Landing zones"
  parent_management_group_id = data.azurerm_management_group.hcta.id
}

resource "azurerm_management_group" "sandbox" {
  name                       = "mg-hcta-sandbox"
  display_name               = "Sandbox"
  parent_management_group_id = data.azurerm_management_group.hcta.id
}

resource "azurerm_management_group" "decommissioned" {
  name                       = "mg-hcta-decommissioned"
  display_name               = "Decommissioned"
  parent_management_group_id = data.azurerm_management_group.hcta.id
}

# Level 2: under Platform
resource "azurerm_management_group" "management" {
  name                       = "mg-hcta-management"
  display_name               = "Management"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "connectivity" {
  name                       = "mg-hcta-connectivity"
  display_name               = "Connectivity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "identity" {
  name                       = "mg-hcta-identity"
  display_name               = "Identity"
  parent_management_group_id = azurerm_management_group.platform.id
}

# Level 2: under Landing zones
resource "azurerm_management_group" "corp" {
  name                       = "mg-hcta-corp"
  display_name               = "Corp"
  parent_management_group_id = azurerm_management_group.landingzones.id
}

resource "azurerm_management_group" "online" {
  name                       = "mg-hcta-online"
  display_name               = "Online"
  parent_management_group_id = azurerm_management_group.landingzones.id
}