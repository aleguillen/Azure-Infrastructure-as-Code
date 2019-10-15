# Creates Resource Group and Virtual Network with specified subnets
module "VirtualNetwork" {
  source = "../Modules/virtual-network"
  
  prefix = var.prefix
  tags = var.tags
  location = var.location

  vnet_cidr = var.vnet_cidr
  vnet_dns_servers = var.vnet_dns_servers

  vnet_subnets_names = var.vnet_subnets_names
  vnet_subnets_newbits = var.vnet_subnets_newbits
  vnet_subnets_netnum = var.vnet_subnets_netnum
  vnet_subnet_service_endpoints = var.vnet_subnet_service_endpoints
}