variable "rg_name" {
    type        = string
    description = "The name of the Resource Group in which the Key Vault exists."
}

variable "tags" {
    type        = map(string)
    description = "A key value pair tags for your resources."
}

variable "kv_name" {
    type        = string
    description = "Specifies the name of the Key Vault."
}

variable "cert_name" {
    type        = string
    description = "Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created."
}

variable "cert_issuer" {
    type        = string
    description = "The name of the Certificate Issuer. Possible values include Self, or the name of a certificate issuing authority supported by Azure. Changing this forces a new resource to be created. Defaults to Self"
    default     = "Self"
}

variable "cert_key_exportable" {
    type        = bool
    description = "Is this Certificate Exportable? Changing this forces a new resource to be created. Defaults to true."
    default     = true
}

variable "cert_key_size" {
    type        = number
    description = "The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created. Defaults to 2048"
    default     = 2048
}

variable "cert_key_type" {
    type        = string
    description = "Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created. Defaults to RSA."
    default     = "RSA"
}

variable "cert_key_reuseable" {
    type        = bool
    description = "Is the key reusable? Changing this forces a new resource to be created."
    default     = true
}

variable "cert_content_type" {
    type        = string
    description = "The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created. Defaults to application/x-pkcs12 for a PFX"
    default     = "application/x-pkcs12"
}

# Variables for Import Cert
variable "cert_path" {
    type        = string
    description = "The file path to the certificate to be base64-encoded. Changing this forces a new resource to be created."
    default     = ""
}

variable "cert_password" {
    type        = string
    description = "The password associated with the certificate. Changing this forces a new resource to be created."
    default     = ""
}

# Variables for Generate Cert
variable "cert_lifetime_action_type" {
    type        = string
    description = "A action block as defined below. Defaults to AutoRenew"
    default     = "AutoRenew"
}

variable "cert_lifetime_days_before_expiry" {
    type        = number
    description = "The number of days before the Certificate expires that the action associated with this Trigger should run. Changing this forces a new resource to be created. Conflicts with lifetime_percentage."
    default     = 30
}

variable "cert_extended_key_usage" {
    type        = list(string)
    description = "A list of Extended/Enhanced Key Usages. Changing this forces a new resource to be created. Server Authentication = 1.3.6.1.5.5.7.3.1 , Client Authentication = 1.3.6.1.5.5.7.3.2"
    default     =  ["1.3.6.1.5.5.7.3.1","1.3.6.1.5.5.7.3.2"]
}

variable "cert_key_usage" {
    type        = list(string)
    description = "A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive. Changing this forces a new resource to be created."
    default     = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
    ]
}

variable "cert_dns_names" {
    type        = list(string)
    description = "A list of alternative DNS names (FQDNs) identified by the Certificate. Changing this forces a new resource to be created."
    default     = []
}

variable "cert_subject" {
    type        = string
    description = "The Certificate's Subject. Changing this forces a new resource to be created. Ex. CN=mydomain.com"
    default     = ""
}

variable "cert_validity_in_months" {
    type        = number
    description = "The Certificates Validity Period in Months. Changing this forces a new resource to be created."
    default     = 12
}