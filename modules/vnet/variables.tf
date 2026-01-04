/** 
VNet Module Resources

Creates:
- azurerm_virtual_network
- azurerm_subnet(one per entry in var.subnets)

*/

variable "resource_group_name" {
  type = string
}


variable "location" {
  type = string
}


variable "vnet_name" { type = string }


variable "address_space" { type = list(string) }

variable "subnets" {
  type = map(string)

}
