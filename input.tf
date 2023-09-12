variable "subnet_v4" {
  type        = string
  description = "The IPv4 subnet in which to create the address(es)."
  default     = null
}
variable "subnet_v6" {
  type        = string
  description = "The IPv6 subnet in which to create the address(es)."
  default     = null
}

variable address_count {
  type        = number
  description = "The number of addresses to create in the new subnet."
  default     = 0
}
variable address_description {
  type        = list(string)
  description = "Descriptions of the addresses that are to be created."
  default     = []
}
variable address_hostname {
  type        = list(string)
  description = "Hostnames of the addresses that are to be created."
  default     = []
}
variable "address_default_description" {
  type        = string
  description = "The default description to put against a host should not description be defined."
  default     = "Created by Terraform"
}
