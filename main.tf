terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {}
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "9a30ad7d-5ae6-44bf-8d98-c57c98447f87"
  features {}
}


resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = "East US"
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

module "storage_account" {
  source               = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  replication_type     = var.replication_type
  tier                 = "Standard"
}

module "network_interface" {
  source                 = "./modules/network_interface"
  network_interface_name = var.network_interface_name
  location               = azurerm_resource_group.main.location
  resource_group_name    = azurerm_resource_group.main.name
  subnet_id              = module.virtual_network.subnet_id
}


module "virtual_machine" {
  source               = "./modules/virtual_machine"
  virtual_machine_name = var.virtual_machine_name
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  virtual_machine_size = var.virtual_machine_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  network_interface_id = module.network_interface.id
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts-gen2"
  image_version        = "20.04.202209200"

}
