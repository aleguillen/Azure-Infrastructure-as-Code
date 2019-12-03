variable "prefix" {
  type        = string
  description = "The prefix for all your resources. Ex.: use 'myprefix' will create a resource group named 'myprefix-rg'"
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

variable "cert_name" {
    type        = string
    description = "Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created. Ex.: mycert"
}

# Import Cert
variable "cert_path" {
    type        = string
    description = "The file path to the certificate to be base64-encoded. Changing this forces a new resource to be created. Ex.: certificate.pfx"
}

variable "cert_password" {
    type        = string
    description = "The password associated with the certificate. Changing this forces a new resource to be created. Ex.: Pass@word!123"
}

# Generate Cert
variable "cert_subject" {
    type        = string
    description = "The Certificate's Subject. Changing this forces a new resource to be created. Ex. CN=testdomain.com"
}