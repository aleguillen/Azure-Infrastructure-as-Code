variable "prefix" {
  type = "string"
  description = "The prefix used for all resources in this example"
}

variable "location" {
  type = "string"
  description = "The Azure location where all resources in this example should be created"
}

variable "resource_tags" {
  type = "object"
  description = "Provice Tags for all resources."
}