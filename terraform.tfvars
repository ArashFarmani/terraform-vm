vcenter_user     = "administrator@lab.local"
vcenter_pass     = "almA!123"
vcenter_ip       = "192.168.2.20"
datacenter_name  = "Lab"
domain           = "Lab.local"


vm_templates = {
  ubuntu_os  = "ubuntut24"
  cenntos_os = "centos7"
}

vm_datastores = {
  ds1= "ssd500"
  ds2 = "ssd500-02"
}


host = {
  host01 = "192.168.2.22"
  host02 = "192.168.2.24"

}




###template vm interfaces 

host_pg = [
  {
    network_name = "Respina PG DS"
    adapter_type = "vmxnet3"
  },
  {
    network_name = "Office MGNT PG DS"
    adapter_type = "vmxnet3"
  }
]

###########################################

