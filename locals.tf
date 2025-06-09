 locals {
  config        = var.vm_create[terraform.workspace]
  template_name = var.vm_create[local.config.vm_template]
}