output "resource_group" {
  value = "${data.azurerm_resource_group.network}"
}

output "vnet" {
  value = "${data.azurerm_virtual_network.network}"
}

output "vnet_subnets" {
  value = "${data.azurerm_subnet.network.*}"
}