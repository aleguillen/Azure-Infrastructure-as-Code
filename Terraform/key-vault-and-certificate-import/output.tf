output "resource_group" {
  value = "${module.KeyVault.resource_group}"
}

output "key_vault" {
  value = "${module.KeyVault.vault}"
}

output "az_account" {
  value = "${data.external.az_account.result}"
}

output "cert_imported" {
  value = "${module.KeyVaultCert.imported_cert}"
}

output "cert_generated" {
  value = "${module.KeyVaultGenCert.generated_cert}"
}
