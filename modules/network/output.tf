output "vnet" {
    value = azurerm_virtual_network.vnet  
}
output "subnet" {
    value = azurerm_subnet.subnet
}

# output "subnet" {
#   # value = [azurerm_public_ip.linux_pub_ip[*].ip_address]
#   value = values(azurerm_subnet.subnet)[*]
# }