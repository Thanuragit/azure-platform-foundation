variable "subscription_id" {
  description = "Azure subscription to deploy into"
  type        = string
}

variable "environment" {
  description = "Environment name: dev, test or prod"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test or prod."
  }
}

variable "workload" {
  description = "Short workload name used in resource names"
  type        = string
  default     = "hcta"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "australiaeast"
}

variable "owner" {
  description = "Team responsible, used in tags"
  type        = string
}

variable "costcentre" {
  description = "Finance cost centre code, used in tags"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_app_prefixes" {
  description = "Address prefixes for the app subnet"
  type        = list(string)
}