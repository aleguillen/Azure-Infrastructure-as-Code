output "vault_accesspolicies_object_id" {
  value = "${azurerm_key_vault_access_policy.accesspolicies_object_id.*}"
}

output "vault_accesspolicies_compound_id" {
  value = "${azurerm_key_vault_access_policy.accesspolicies_compound_id.*}"
}