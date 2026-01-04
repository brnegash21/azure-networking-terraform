resource "azurerm_resource_group" "lab" {
    name = "rg-az700-networking-lab"
    location = "eastus"
}

locals {
    location = azurerm_resource_group.lab.location
}

module "hub_vnet" {
    source = "../../modules/vnet"
    resource_group_name = azurerm_resource_group.lab.name
    location = local.location
    vnet_name = "vnet-hub-az700"
    address_space = [ "10.0.0.0/16" ]

    subnets = {
      AzureBastionSubnet = "10.0.1.0/24"
      AzureFirewallSubnet = "10.0.2.0/24"
      shared-services = "10.0.10.0/24"
    }
}

module "spoke1_vnet" {
    source = "../../modules/vnet"
    resource_group_name = azurerm_resource_group.lab.name
    location = local.location
    vnet_name = "vnet-spoke1-az700"
    address_space = ["10.1.0.0/16"]

    subnets = {
      app = "10.1.1.0/24"
      data = "10.1.2.0/24"
    }
    
}

module "spoke2_vnet"{
    source = "../../modules/vnet"
    resource_group_name = azurerm_resource_group.lab.name
    location = local.location
    vnet_name = "vnet-spoke2-az700"
    address_space = ["10.2.0.0/16"]

    subnets = {
      app = "10.2.1.0/24"
      data = "10.2.2.0/24"
    }
}

    