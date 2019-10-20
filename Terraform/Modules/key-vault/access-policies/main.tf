data "azurerm_subscription" "current" {}

# Get existing Key Vault
data "azurerm_key_vault" "vault" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

# Adding Access Policy per Object ID
resource "azurerm_key_vault_access_policy" "accesspolicies_object_id" {
    count = length(var.ap_object_ids)

    key_vault_id    = data.azurerm_key_vault.vault.id
    tenant_id       = data.azurerm_subscription.current.tenant_id

    object_id = var.ap_object_ids[count.index]
    
    key_permissions = var.ap_key_permissions
    certificate_permissions = var.ap_certificate_permissions
    secret_permissions = var.ap_secret_permissions
    storage_permissions = var.ap_storage_permissions
}

# Adding Access Policy per Object ID and Application ID map - COMPOUND IDENTITY
resource "azurerm_key_vault_access_policy" "accesspolicies_compound_id" {
    count = length(keys(var.ap_object_ids_application_ids_map))

    key_vault_id    = data.azurerm_key_vault.vault.id
    tenant_id       = data.azurerm_subscription.current.tenant_id

    object_id = keys(var.ap_object_ids_application_ids_map)[count.index]
    application_id = var.ap_object_ids_application_ids_map[keys(var.ap_object_ids_application_ids_map)[count.index]] == "" ? null : var.ap_object_ids_application_ids_map[keys(var.ap_object_ids_application_ids_map)[count.index]]
    
    key_permissions = var.ap_key_permissions
    certificate_permissions = var.ap_certificate_permissions
    secret_permissions = var.ap_secret_permissions
    storage_permissions = var.ap_storage_permissions
}
