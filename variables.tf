variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "replication_type" {
  description = "The replication type."
  type        = string
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The administrator username."
  type        = string
}

variable "admin_password" {
  description = "The administrator password."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  type    = string
  default = "TerraformResource"
}

/*
variable "backend_storage_account_name" {
  type = string

}
variable "container_name" {
  type = string

}
variable "storage_key" {
  type = string
}
*/