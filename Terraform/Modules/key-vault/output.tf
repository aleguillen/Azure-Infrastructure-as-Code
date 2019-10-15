output "resource_group" {
  value = "${azurerm_resource_group.vault}"
}

output "vault" {
  value = "${azurerm_key_vault.vault}"
}

output "vault_accesspolicies_object_id" {
  value = "${azurerm_key_vault_access_policy.accesspolicies_object_id.*}"
}

output "vault_accesspolicies_compound_id" {
  value = "${azurerm_key_vault_access_policy.accesspolicies_compound_id.*}"
}