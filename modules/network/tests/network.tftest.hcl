mock_provider "azurerm" {}

variables {
  workload            = "hcta"
  environment         = "dev"
  location            = "australiaeast"
  vnet_address_space  = ["10.9.0.0/16"]
  subnet_app_prefixes = ["10.9.1.0/24"]
  tags                = { owner = "test" }
}

run "names_follow_standard" {
  command = plan

  assert {
    condition     = azurerm_resource_group.this.name == "rg-hcta-dev"
    error_message = "Resource group name does not follow the naming standard."
  }

  assert {
    condition     = azurerm_virtual_network.this.name == "vnet-hcta-dev"
    error_message = "VNet name does not follow the naming standard."
  }
}

run "security_baseline" {
  command = plan

  assert {
    condition = anytrue([
      for r in azurerm_network_security_group.app.security_rule :
      r.name == "deny-all-inbound" && r.access == "Deny" && r.priority == 4096
    ])
    error_message = "NSG must have deny-all-inbound at priority 4096."
  }

  assert {
    condition     = azurerm_subnet.app.default_outbound_access_enabled == false
    error_message = "App subnet must not have default outbound access."
  }
}

run "rejects_invalid_environment" {
  command = plan

  variables {
    environment = "uat"
  }

  expect_failures = [var.environment]
}