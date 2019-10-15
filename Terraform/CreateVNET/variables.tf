variable "prefix" {
  type        = string
  description = "The prefix for all your resources. Ex.: <prefix>-rg, <prefix>-vnet"
  default     = "aleterr"
}

variable "tags" {
  type        = map(string)
  description = "A key value pair tags for your resources."
  default = {
    environment = "dev"
  }
}

variable "location" {
  type        = string
  description = "The Azure region where your resources will be created."
  default     = "East US"
}

variable "vnet_cidr" {
  type        = string
  description = "The list of address spaces for the VNet."
  default     = "10.0.0.0/16"
}

variable "vnet_dns_servers" {
  type        = list(string)
  description = "List of IP addresses of DNS servers"
  default     = []
}

variable "vnet_subnets_names" {
  type        = list(string)
  description = "The list of of subnets in the VNet."
  default = [
    "subnet1",
    "subnet2",
  ]
}

variable "vnet_subnets_newbits" {
  type        = number
  description = "The newbits for the specified Subnets. Ex. cidrsubnet('10.0.0.0/16',8,0) = 10.0.0.0/24"
  default     = 8
}

variable "vnet_subnets_netnum" {
  type        = number
  description = "The netnum for the specified Subnets. Ex. cidrsubnet('10.0.0.0/16',8,1) = 10.0.1.0/24"
  default     = 0
}

variable "vnet_subnet_service_endpoints" {
  type = list(string)
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
  default = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.AzureCosmosDB",
    "Microsoft.EventHub",
    "Microsoft.KeyVault",
    "Microsoft.ServiceBus",
    "Microsoft.Sql",
    "Microsoft.Storage",
  ]
}

