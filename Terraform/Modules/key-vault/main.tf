data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "vault" {
    name     = local.rg_name
    location = var.location
    tags     = var.tags
}

resource "azurerm_key_vault" "vault" {
    name                        = local.kv_name
    location                    = azurerm_resource_group.vault.location
    resource_group_name         = azurerm_resource_group.vault.name
    tenant_id                   = data.azurerm_subscription.current.tenant_id
    tags = var.tags      

    sku_name = var.kv_sku

    enabled_for_disk_encryption = var.kv_enabled_for_disk_encryption
    enabled_for_deployment = var.kv_enabled_for_deployment
    enabled_for_template_deployment = var.kv_enabled_for_template_deployment

    network_acls {
        default_action  = var.acls_default_action
        bypass          = var.acls_bypass
        ip_rules        = var.acls_ip_rules
        virtual_network_subnet_ids  = var.acls_virtual_network_subnet_ids
    }
}

module "KeyVaultAccessPolicies" {
    source = "../key-vault-access-policies"
  
    rg_name = azurerm_resource_group.vault.name
    kv_name = azurerm_key_vault.vault.name

    ap_object_ids = var.ap_object_ids
    ap_object_ids_application_ids_map = var.ap_object_ids_application_ids_map
    ap_certificate_permissions = var.ap_certificate_permissions
    ap_key_permissions = var.ap_key_permissions
    ap_secret_permissions = var.ap_secret_permissions
    ap_storage_permissions = var.ap_storage_permissions
}


# # Adding Access Policy per Object ID
# resource "azurerm_key_vault_access_policy" "accesspolicies_object_id" {
#     count = length(var.ap_object_ids)

#     key_vault_id    = azurerm_key_vault.vault.id
#     tenant_id       = data.azurerm_subscription.current.tenant_id

#     object_id = var.ap_object_ids[count.index]
    
#     key_permissions = var.ap_key_permissions
#     certificate_permissions = var.ap_certificate_permissions
#     secret_permissions = var.ap_secret_permissions
#     storage_permissions = var.ap_storage_permissions
# }

# # Adding Access Policy per Object ID and Application ID map - COMPOUND IDENTITY
# resource "azurerm_key_vault_access_policy" "accesspolicies_compound_id" {
#     count = length(keys(var.ap_object_ids_application_ids_map))

#     key_vault_id    = azurerm_key_vault.vault.id
#     tenant_id       = data.azurerm_subscription.current.tenant_id

#     object_id = keys(var.ap_object_ids_application_ids_map)[count.index]
#     application_id = var.ap_object_ids_application_ids_map[keys(var.ap_object_ids_application_ids_map)[count.index]] == "" ? null : var.ap_object_ids_application_ids_map[keys(var.ap_object_ids_application_ids_map)[count.index]]
    
#     key_permissions = var.ap_key_permissions
#     certificate_permissions = var.ap_certificate_permissions
#     secret_permissions = var.ap_secret_permissions
#     storage_permissions = var.ap_storage_permissions
# }
