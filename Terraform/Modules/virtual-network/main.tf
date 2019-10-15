# Create Resource Group
resource "azurerm_resource_group" "network" {
  name      = local.rg_name
  location  = var.location
  tags      = var.tags
}

#Create Virtual Network
resource "azurerm_virtual_network" "network" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  tags                = var.tags

  address_space       = [var.vnet_cidr]
  dns_servers         = length(var.vnet_dns_servers) > 0 ? var.vnet_dns_servers : null
}

# Create Subnets
resource "azurerm_subnet" "network" {
  count = length(var.vnet_subnets_names)

  name                 = var.vnet_subnets_names[count.index]
  resource_group_name  =azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.network.name

  address_prefix = cidrsubnet(
    var.vnet_cidr,
    var.vnet_subnets_newbits,
    var.vnet_subnets_netnum + count.index,
  )

  service_endpoints = length(var.vnet_subnet_service_endpoints) > 0 ? var.vnet_subnet_service_endpoints : null
}
