###vcenter credential
variable "vcenter_user" {
    type    = string
}

variable "vcenter_pass" {
    type    = string
}

variable "vcenter_ip" {
    type    = string
}

variable "datacenter_name" {
    type    = string
}

variable "host" {
    type    = map(string)
}

variable "domain" {
    type = string
}

variable "vm_templates" {
    type    = map(string)
}

variable "vm_datastores" {
    type    = map(string)
}


variable "host_pg" {
    type       = map(object({ 
        network_name   = string
        adaptor_type   = string
    }))
}


variable "vm_memory"{
    type              = number 
}

variable "vm_cpu"{
    type              = number 
}



#############################################

variable "vm_create" {
    description      = "argument that change in each vm"
    type             = map(object({
        vm_host               = string
        vm_name               = string       
        vm_template           = string     
        vm_cpu                = number
        vm_memory             = number
        vm_nic01_ipv4_address = string
        vm_nic01_ipv4_netmask = string
        vm_nic01_ipv4_gateway = string
        vm_disks              = list(object({
            label             = string
            size              = number
            provisioning_type = string
            datastore_key     = string
        }))
        network_interfaces = list(object({
            network_name = string
            adapter_type = string
        }))

    }))
}





#######################


# variable "vm_disks" {
#   description = "List of disk configurations with provisioning type"
#   type = map(object({
#     label             = string
#     size              = number
#     provisioning_type = string # "thin", "eagerZeroedThick", or "lazyZeroedThick"
#   }))
# }
