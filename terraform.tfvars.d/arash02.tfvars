vm_create = {
  arash02 = { # Changed key and vm_name to arash02 to differentiate
    vm_host_key           = "host02_key" # Key to lookup in var.host_names
    vm_name               = "arash02"
    vm_template_key       = "centos_os" # Using centos template for arash02
    vm_cpu                = 4
    vm_memory             = 4096
    primary_datastore_key = "ds2" # Different datastore for arash02

    vm_disks = [
      {
        label             = "Disk 1"
        size              = 30 # Different disk size
        provisioning_type = "thin"
        datastore_key     = "ds2"
      }
    ]
    network_interfaces = [
      {
        network_name        = "Respina PG DS"
        adapter_type        = "vmxnet3"
        ipv4_address        = "46.209.96.140" # Different IP
        ipv4_netmask        = "255.255.255.240"
        ipv4_gateway        = "46.209.96.129"
      }
    ]
  }
}