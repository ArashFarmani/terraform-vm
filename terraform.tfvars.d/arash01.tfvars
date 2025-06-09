vm_create = {
  arash01 = {
    vm_host_key           = "host01_key"
    vm_name               = "arash01"   
    vm_template_key       = "ubuntu_os"
    vm_cpu                = 2
    vm_memory             = 2048
    primary_datastore_key = "ds1"
    vm_disks = [
      {
        label             = "Disk 1"
        size              = 20
        provisioning_type = "thin"
        datastore_key     = "ds1"
        unit_number       = 0 # <-- ASSIGN UNIQUE UNIT NUMBER

      },
      {
        label             = "Disk 2"
        size              = 40
        provisioning_type = "eagerZeroedThick"
        datastore_key     = "ds2"
        unit_number       = 1 # <-- ASSIGN UNIQUE UNIT NUMBER

      }
    ]
    network_interfaces = [
      {
        network_name        = "assign your config"
        adapter_type        = "vmxnet3"
        ipv4_address        = "assign your config"
        ipv4_netmask        = 28
        ipv4_gateway        = "assign your config"
      },
      {
        network_name        = "assign your config"
        adapter_type        = "vmxnet3"
        ipv4_address        = "assign your config"
        ipv4_netmask        = 24

      }
    ]

  }
 }

