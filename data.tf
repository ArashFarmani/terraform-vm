data "vsphere_datacenter" "datacenter_name" {
  name = var.datacenter_name
}

data "vsphere_virtual_machine" "template" {
  name          = local.template_name # Now correctly derived from locals.tf
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}

data "vsphere_datastore" "datastore" {
  for_each      = var.vm_datastores # Still iterates over all defined datastores
  name          = each.value
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}

# NEW: Data source to fetch the SPECIFIC host for this VM based on local.config
data "vsphere_host" "selected_host" {
  name          = local.host_name # Using the resolved host name from locals
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
 }

data "vsphere_network" "networks" {
  for_each = {
    for ni in local.config.network_interfaces : ni.network_name => ni
  }
  name          = each.value.network_name
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}

# All commented-out and incorrect data blocks have been removed for cleanliness.