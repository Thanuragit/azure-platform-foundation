module "network" {
  source = "../../modules/network"

  workload            = var.workload
  environment         = var.environment
  location            = var.location
  vnet_address_space  = var.vnet_address_space
  subnet_app_prefixes = var.subnet_app_prefixes
  tags                = local.tags
}

moved {
  from = azurerm_resource_group.this
  to   = module.network.azurerm_resource_group.this
}

moved {
  from = azurerm_virtual_network.this
  to   = module.network.azurerm_virtual_network.this
}

moved {
  from = azurerm_subnet.app
  to   = module.network.azurerm_subnet.app
}

moved {
  from = azurerm_network_security_group.app
  to   = module.network.azurerm_network_security_group.app
}

moved {
  from = azurerm_subnet_network_security_group_association.app
  to   = module.network.azurerm_subnet_network_security_group_association.app
}