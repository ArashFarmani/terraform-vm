vm_create = {
  AryaInstitute-B1 = {
    vm_host_key           = "host02_key"
    vm_name               = "AryaInstitute-B1"   
    vm_template_key       = "ubuntu22_os"
    vm_cpu                = 10
    vm_memory             = 18432
    primary_datastore_key = "host02-ds2"
    vm_disks = [
                  {
        label             = "Disk 1"
        size              = 100
        provisioning_type = "eagerZeroedThin"
        datastore_key     = "host02-ds2"
        unit_number       = 0 # <-- ASSIGN UNIQUE UNIT NUMBER

      }
    ]
    network_interfaces = [
      {
        network_name        = "internet-v1011"
        adapter_type        = "vmxnet3"
        ipv4_address        = "93.115.150.140"
        ipv4_netmask        = 29
        ipv4_gateway        = "93.115.150.137"
      }
    ]

  }
 }

