# The terraform.tfvars file can be used to specify variables
vnet_name              = "prod_vnet"
address_space          = ["10.0.0.0/16"]
subnet_name            = "my-subnet-prod"
subnet_prefixes        = ["10.0.1.0/24"]
storage_account_name   = "prod76eydegdg632"
replication_type       = "GRS"
network_interface_name = "prod_nic"
virtual_machine_name   = "prodvm1"
virtual_machine_size   = "Standard_DS1_v2"
admin_username         = "prod_admin1"
admin_password         = "prod@password1"
resource_group_name    = "ProdResourceGroup"