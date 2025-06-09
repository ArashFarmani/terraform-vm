###vcenter credential
variable "vcenter_user" {
    type    = string
    sensitive = true
}

variable "vcenter_pass" {
    type    = string
    sensitive = true
}

variable "vcenter_ip" {
    type    = string
}

variable "datacenter_name" {
    type    = string
}

variable "host_names" { # Renamed from host_pg for clarity of purpose
    type        = map(string)
    description = "Map of logical host keys to actual vSphere host names for VM placement."
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


# variable "host_portgroup" {
#     type       = map(object({ 
#         network_name   = string
#         adaptor_type   = string
#     }))
# }




#############################################

variable "vm_create" {
    description = "Argument that changes in each vm, holding specific VM configurations."
    type             = map(object({
        vm_host_key           = string
        vm_name               = string       
        vm_template_key       = string     
        vm_cpu                = number
        vm_memory             = number
        primary_datastore_key = optional(string) 
        vm_disks              = list(object({
            label             = string
            size              = number
            provisioning_type = string
            datastore_key     = string
            unit_number       = optional(number)
        }))
        network_interfaces    = list(object({
            network_name      = string
            adapter_type      = string
            ipv4_address      = optional(string) # Optional for DHCP
            ipv4_netmask      = optional(number)
            ipv4_gateway      = optional(string) # Optional for DHCP/multi-NIC
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
