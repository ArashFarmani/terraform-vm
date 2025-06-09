data "vsphere_datacenter" "datacenter_name" {
  name = var.datacenter_name
}

data "vsphere_virtual_machine" "template" {
  name          = local.template_name
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}

data "vsphere_datastore" "datastore" {
  for_each      = var.vm_datastores
  name          = each.value
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}

data "vsphere_host" "host" {
  name          = local.host
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}



data "vsphere_network" "networks" {
  for_each = {
    for ni in local.config.network_interfaces : ni.network_name => ni
  }
  name          = each.value.network_name
  datacenter_id = data.vsphere_datacenter.datacenter_name.id
}



###Lookup for each network in vm_network_interfaces
# data "vsphere_network" "networks" {
#   for_each      = { for ni in var.vm_network_interfaces : ni.network_name => ni }
#   name          = each.value.name
#   datacenter_id = data.vsphere_datacenter.datacenter_name.id
# }

# data "vsphere_datastore" "vdisk" {
#   for_each    = toset (["ssd500", "ssd500-02"])
#   Name        = each.key
# }