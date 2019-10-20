variable "rg_name" {
    type        = string
    description = "The name of the Resource Group in which the Key Vault exists."
}

variable "kv_name" {
    type        = string
    description = "Specifies the name of the Key Vault."
}

# Access Policies Variables
variable "ap_object_ids" {
    type = list(string)
    description = "The list object IDs of users, service principals or security groups in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
    default     = []
}

variable "ap_object_ids_application_ids_map" {
    type = map(string)
    description = "The list object IDs of users, service principals or security groups in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
    default     = {}
}

variable "ap_certificate_permissions" {
    type = list(string)
    description = "List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update."
    default = [
      "create",
      "delete",
      "deleteissuers",
      "get",
      "getissuers",
      "import",
      "list",
      "listissuers",
      "managecontacts",
      "manageissuers",
      "setissuers",
      "update",
    ]
}

variable "ap_key_permissions" {
    type = list(string)
    description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
    default = [
      "backup",
      "create",
      "decrypt",
      "delete",
      "encrypt",
      "get",
      "import",
      "list",
      "purge",
      "recover",
      "restore",
      "sign",
      "unwrapKey",
      "update",
      "verify",
      "wrapKey",
    ]
}

variable "ap_secret_permissions" {
    type = list(string)
    description = "List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set."
    default = [
      "backup",
      "delete",
      "get",
      "list",
      "purge",
      "recover",
      "restore",
      "set",
    ]
}

variable "ap_storage_permissions" {
    type = list(string)
    description = " List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
    default = [
      "backup",
      "delete",
      "deletesas",
      "get",
      "getsas",
      "list",
      "listsas",
      "purge",
      "recover",
      "regeneratekey",
      "restore",
      "set",
      "setsas",
      "update",
    ]
}