locals {
  config        = var.vm_create[terraform.workspace]
  # Correctly lookup the actual template name using the key from local.config
  template_name = var.vm_templates[local.config.vm_template_key]
  # Lookup the actual host name using the key from local.config
  host_name     = var.host_names[local.config.vm_host_key]
  # Lookup the primary datastore name if specified
  primary_datastore_name = local.config.primary_datastore_key != null ? var.vm_datastores[local.config.primary_datastore_key] : null
}