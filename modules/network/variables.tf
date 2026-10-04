variable "workload" {
  description = "Workload name, used in resource naming (e.g. hcta)."
  type        = string
}

variable "environment" {
  description = "Environment name, used in resource naming (dev, test or prod)."
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test or prod."
  }
}

variable "location" {
  description = "Azure region for all resources in this module."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet, e.g. [\"10.0.0.0/16\"]."
  type        = list(string)
}

variable "subnet_app_prefixes" {
  description = "Address prefixes for the app subnet, e.g. [\"10.0.1.0/24\"]"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to all taggable resources."
  type        = map(string)
}