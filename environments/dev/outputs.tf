output "resource_group_name" {
  value = module.network.resource_group_name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_app_id" {
  value = module.network.subnet_app_id
}

output "nsg_app_id" {
  value = module.network.nsg_app_id
}