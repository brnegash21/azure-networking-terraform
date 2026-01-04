

output "vnet_id" {
    value = azurerm_virtual_network.this.id
    description = "Resource ID of the created Virtual Network"
}

output "vnet_name"{
    value = azurerm_virtual_network.this.name
    description = "Name of the created Virtual Network"
}

output "subnet_name"{
    value = {
        for subnet_name, subnet in azurerm_subnet.this : subnet_name => subnet.id 
    }
    description = "Map of subnet name to subnet resource id"
}
