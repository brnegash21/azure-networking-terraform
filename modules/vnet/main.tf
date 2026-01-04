resource "azurerm_virtual_network" "this" {
  # Azure name for the vnet
  name = var.vnet_name

  # Azure region
  location = var.location

  # Resource group where the VNet will exist
  resource_group_name = var.resource_group_name

  # One or more CIDR blocks for the VNet
  address_space = var.address_space

}

#-------------------------------------------------------------
# Subnets
#-------------------------------------------------------------

resource "azurerm_subnet" "this" {
  # for each loops over the map: subnet_name => cidr
  for_each = var.subnets

  # each.key is the subnet name
  name = each.key

  # Put subnet in the same resource group as the VNet
  resource_group_name = var.resource_group_name

  # Associate subnet to the VNet created above
  virtual_network_name = azurerm_virtual_network.this.name

  # CIDR block for the subnet
  # Azure expects a list for address_prefixes
  address_prefixes = [each.value]
}
