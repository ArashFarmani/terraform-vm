terraform {
    required_providers {
        vsphere = {
            source  = "hashicorp/vsphere"
            version = "2.10.0"
        }
    }
}

provider "vsphere" {
  user                 = var.vcenter_user
  password             = var.vcenter_pass
  vsphere_server       = var.vcenter_ip
  allow_unverified_ssl = true
  api_timeout          = 10
}
