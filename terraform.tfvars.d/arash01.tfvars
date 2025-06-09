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
        network_name        = "Respina PG DS"
        adapter_type        = "vmxnet3"
        ipv4_address        = "46.209.96.139"
        ipv4_netmask        = 28
        ipv4_gateway        = "46.209.96.129"
      },
      {
        network_name        = "Office MGNT PG DS"
        adapter_type        = "vmxnet3"
        ipv4_address        = "192.168.2.44"
        ipv4_netmask        = 24
        # ipv4_gateway is typically defined once at the customize block level if shared,
        # or omitted if DHCP. Add here if specific to this NIC.
      }
    ]

  }
 }

