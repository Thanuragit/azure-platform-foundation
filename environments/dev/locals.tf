locals {
  name_suffix = "${var.workload}-${var.environment}"

  tags = {
    owner       = var.owner
    environment = var.environment
    costcentre  = var.costcentre
    managed_by  = "terraform"
  }
}