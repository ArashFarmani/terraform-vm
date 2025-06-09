resource "vsphere_virtual_machine" "vm_create" {
    name                        = local.config.vm_name
    resource_pool_id            = data.vsphere_host.selected_host.resource_pool_id
    datastore_id                = data.vsphere_datastore.datastore[local.config.primary_datastore_key].id
    num_cpus                    = local.config.vm_cpu
    cpu_hot_add_enabled         = true
    memory                      = local.config.vm_memory 
    memory_hot_add_enabled      = true
    guest_id                    = data.vsphere_virtual_machine.template.guest_id
    scsi_type                   = data.vsphere_virtual_machine.template.scsi_type
    firmware                    = data.vsphere_virtual_machine.template.firmware
    wait_for_guest_net_timeout  = 5  # Wait 5 minutes for network

  dynamic "network_interface" {
    for_each = local.config.network_interfaces
    content {
      network_id   = data.vsphere_network.networks[network_interface.value.network_name].id
      adapter_type = network_interface.value.adapter_type
    }
  }

  dynamic "disk" {
    for_each = local.config.vm_disks
    content {
      label             = disk.value.label
      size              = disk.value.size
      thin_provisioned  = disk.value.provisioning_type == "thin" ? true : false
      eagerly_scrub     = disk.value.provisioning_type == "eagerZeroedThick" ? true : false
      datastore_id      = data.vsphere_datastore.datastore[disk.value.datastore_key].id
      unit_number       = lookup(disk.value, "unit_number", null) # <-- ADDED THIS LINE

    }
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = local.config.vm_name
        domain    = var.domain
      }
      dynamic "network_interface" {
        for_each = local.config.network_interfaces
        content {
          # Use lookup with null as default to handle optional attributes
          ipv4_address = lookup(network_interface.value, "ipv4_address", null)
          ipv4_netmask = lookup(network_interface.value, "ipv4_netmask", null)
        }
      }
      ipv4_gateway = length(local.config.network_interfaces) > 0 ? lookup(local.config.network_interfaces[0], "ipv4_gateway", null) : null
    }
    
  }


}