output "resource_group" {
  value = "${azurerm_resource_group.network}"
}

output "vnet" {
  value = "${azurerm_virtual_network.network}"
}

output "vnet_subnets" {
  value = "${azurerm_subnet.network.*}"
}