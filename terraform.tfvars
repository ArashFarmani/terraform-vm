vcenter_user     = "administrator@vsphere.local"
vcenter_pass     = "z}a0?B#iM[?!eUHq"
vcenter_ip       = "172.18.10.10"
datacenter_name  = "Dc2-Yavin"
domain           = "yavin.cloud"


vm_templates = {
  ubuntu22_os  = "ubuntu_os_22.04"
  ubuntu24_os = "ubuntu-24-lts"
}

vm_datastores = {
  host02-ds1 = "Raid5-Disk"
  host02-ds2 = "SSD-1T-New.10.4"
  host02-ds3 = "SsdDisk-10.4"
}


host_names = {
  host01_key = "172.18.10.2"
  host02_key = "172.18.10.4"
}

ssh_private_key_path = "/Users/arashfarmani/Arash/Work/Project/Arya-Edu/terraform-vm/key/id_rsa"


###########################################

