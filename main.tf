resource "vsphere_virtual_machine" "vm_create" {
    name                        = local.config.vm_name
    resource_pool_id            = data.vsphere_host.host.resource_pool_id
    datastore_id                = data.vsphere_datastore.vidsk.id
    num_cpus                    = var.vm_cpu
    cpu_hot_add_enabled         = true
    memory                      = var.vm_memory
    memory_hot_add_enabled      = true
    guest_id                    = data.vsphere_virtual_machine.vm.guest_id
    scsi_type                   = data.vsphere_virtual_machine.vm.scsi_type
    firmware                    = data.vsphere_virtual_machinevm.firmware
    wait_for_guest_net_timeout  = 5  # Wait 5 minutes for network

  dynamic "network_interface" {
    for_each = local.config.network_interfaces
    content {
      network_id   = data.vsphere_network.networks[network_interface.value.network_name].id
      adapter_type = network_interface.value.adapter_type
    }
  }

  dynamic "disk" {
    for_each = local.config.disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      thin_provisioned = disk.value.provisioning_type == "thin" ? true : false
      eagerly_scrub    = disk.value.provisioning_type == "eagerZeroedThick" ? true : false
      datastore_id     = data.vsphere_datastore.datastore[disk.value.datastore_key].id
    }
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = local.config.vm_name
        domain    = var.domain
      }

      # We can just configure 1st NIC here for IP — customize block doesn’t need all NICs
      network_interface {
        ipv4_address = local.config.vm_nic01_ipv4_address
        ipv4_netmask = local.config.vm_nic01_ipv4_netmask
      }
      network_interface {
        ipv4_address = local.config.vm_nic02_ipv4_address
        ipv4_netmask = local.config.vm_nic02_ipv4_netmask
      }
      ipv4_gateway = local.config.vm_nic01_ipv4_gateway
    }
  }


}