module "network" {
  source = "../../modules/network"

  workload            = var.workload
  environment         = var.environment
  location            = var.location
  vnet_address_space  = var.vnet_address_space
  subnet_app_prefixes = var.subnet_app_prefixes
  tags                = local.tags
}
