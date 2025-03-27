# The terraform.tfvars file can be used to specify variables
vnet_name              = "dev_vnet"
address_space          = ["10.2.0.0/16"]
subnet_name            = "my-subnet-dev"
subnet_prefixes        = ["10.2.0.0/24"]
storage_account_name   = "dev76eydegdg632"
replication_type       = "LRS"
network_interface_name = "dev_nic"
virtual_machine_name   = "devvm1"
virtual_machine_size   = "Standard_DS1_v2"
admin_username         = "dev_admin1"
admin_password         = "dev@password1"
resource_group_name    = "DevResourceGroup"