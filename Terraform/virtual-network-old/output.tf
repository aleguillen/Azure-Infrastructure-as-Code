output "resource_group" {
  value = "${module.VirtualNetwork.resource_group}"
}

output "vnet" {
  value = "${module.VirtualNetwork.vnet}"
}

output "vnet_subnets" {
  value = "${module.VirtualNetwork.vnet_subnets}"
}