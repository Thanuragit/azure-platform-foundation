# Network module

Builds a standard HCTA network for one environment: a resource group,
a virtual network, an app subnet with no default outbound access, and
an NSG allowing HTTPS from within the VNet only, with an explicit
deny-all inbound rule.

Resource names are built inside the module from `workload` and
`environment` (e.g. `rg-hcta-dev`), so every environment follows the
naming standard. The module has no backend or provider block; the
calling environment owns both.

## Inputs

| Name | Type | Description |
|---|---|---|
| `workload` | string | Workload name used in resource names |
| `environment` | string | `dev`, `test` or `prod` (validated) |
| `location` | string | Azure region |
| `vnet_address_space` | list(string) | VNet address space |
| `subnet_app_prefixes` | list(string) | App subnet prefixes |
| `tags` | map(string) | Tags applied to all taggable resources |

## Outputs

| Name | Description |
|---|---|
| `resource_group_name` | Resource group name |
| `vnet_id` | Virtual network ID |
| `subnet_app_id` | App subnet ID |
| `nsg_app_id` | App subnet NSG ID |

## Usage

```hcl
module "network" {
  source              = "../../modules/network"
  workload            = "hcta"
  environment         = "dev"
  location            = "australiaeast"
  vnet_address_space  = ["10.0.0.0/16"]
  subnet_app_prefixes = ["10.0.1.0/24"]
  tags                = local.tags
}
```