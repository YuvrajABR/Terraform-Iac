output "vnetname" {
    value = azurerm_virtual_network.vnet.name
}
output "subnet" {
    value = azurerm_virtual_network.vnet.subnet
}

output "bke_nsg_name" {
    value = azurerm_network_security_group.bke_nsg.name
}

output "core_nsg_name" {
    value = azurerm_network_security_group.core_nsg.name
}
output "dmz_nsg_name" {
    value = azurerm_network_security_group.dmz_nsg.name
}
output "cedg_nsg_name" {
    value = azurerm_network_security_group.edg_nsg.name
}