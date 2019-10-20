output "generated_cert" {
  value = "${azurerm_key_vault_certificate.generated_cert}"
}

output "imported_cert" {
  value = "${azurerm_key_vault_certificate.imported_cert}"
}