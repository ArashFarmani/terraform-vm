vm_create = {
  arash01 = {
    vm_host               = "host01"
    vm_name               = "arash01"   
    vm_template           = "ubuntu_os"
    vm_cpu                = 2
    vm_memory             = 2048
    vm_datastores         = ""
    vm_nic01_ipv4_address = "46.209.96.139"
    vm_nic01_ipv4_netmask = "255.255.255.240"
    vm_nic01_ipv4_gateway = "46.209.96.129"
    vm_nic02_ipv4_address = "192.168.2.44"
    vm_nic02_ipv4_netmask = "255.255.255.0"
    disks = [
      {
        label             = "Disk 1"
        size              = 20
        provisioning_type = "thin"
        datastore_key     = "ds1"
      },
      {
        label             = "Disk 2"
        size              = 40
        provisioning_type = "eagerZeroedThick"
        datastore_key     = "ds2"
      }
    ]
    network_interfaces = [
      {
        network_name = "Respina PG DS"
        adapter_type = "vmxnet3"
      },
      {
        network_name = "Office MGNT PG DS"
        adapter_type = "vmxnet3"
      }
    ]

  }
 }

