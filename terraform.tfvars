vcenter_user     = "administrator@lab.local"
vcenter_pass     = "almA!123"
vcenter_ip       = "192.168.2.20"
datacenter_name  = "Lab"
domain           = "Lab.local"


vm_templates = {
  ubuntu_os  = "ubuntu24"
  cenntos_os = "centos7"
}

vm_datastores = {
  ds1= "ssd500"
  ds2 = "ssd500-02"
}


host_names = {
  host01_key = "192.168.2.22" 
  host02_key = "192.168.2.24" 
}



###########################################

