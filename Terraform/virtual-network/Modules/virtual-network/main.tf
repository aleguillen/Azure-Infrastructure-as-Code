# Create Resource Group
resource "azurerm_resource_group" "network" {
  count = var.vnetNewOrExisting == "new" ? 1 : 0

  name      = local.rg_name
  location  = var.location
  tags      = var.tags
}

data "azurerm_resource_group" "network" {
  name = var.vnetNewOrExisting == "new" ? azurerm_resource_group.network[0].name : local.rg_name
}

#Create Virtual Network
resource "azurerm_virtual_network" "network" {
  count = var.vnetNewOrExisting == "new" ? 1 : 0

  name                = local.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  tags                = var.tags

  address_space       = [var.vnet_cidr]
  dns_servers         = length(var.vnet_dns_servers) > 0 ? var.vnet_dns_servers : null
}

data "azurerm_virtual_network" "network" {
  name                = var.vnetNewOrExisting == "new" ? azurerm_virtual_network.network[0].name : local.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
}

# Create Subnets
resource "azurerm_subnet" "network" {
  count = var.vnetNewOrExisting == "new" ? length(var.vnet_subnets_names) : 0

  name                 = var.vnet_subnets_names[count.index]
  resource_group_name  = data.azurerm_resource_group.network.name
  virtual_network_name = data.azurerm_virtual_network.network.name

  address_prefix = cidrsubnet(
    var.vnet_cidr,
    var.vnet_subnets_newbits,
    var.vnet_subnets_netnum + count.index,
  )
  
  service_endpoints = length(var.vnet_subnet_service_endpoints) > 0 ? var.vnet_subnet_service_endpoints : null
}

data "azurerm_subnet" "network" {
  count = length(var.vnet_subnets_names)

  name                 = var.vnetNewOrExisting == "new" ? azurerm_subnet.network[count.index].name : var.vnet_subnets_names[count.index]
  virtual_network_name = data.azurerm_virtual_network.network.name
  resource_group_name  = data.azurerm_resource_group.network.name
}