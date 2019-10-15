# Get existing Key Vault
data "azurerm_key_vault" "vault" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

# Import Certificate
resource "azurerm_key_vault_certificate" "imported_cert" {
    count = local.is_cert_imported ? 1 : 0

    name          = var.cert_name
    key_vault_id  = data.azurerm_key_vault.vault.id
    tags          = var.tags

    certificate {
        contents = filebase64(var.cert_path)
        password = var.cert_password
    }

    certificate_policy {
        issuer_parameters {
            name = var.cert_issuer
        }

        key_properties {
            exportable = var.cert_key_exportable
            key_size   = var.cert_key_size
            key_type   = var.cert_key_type
            reuse_key  = var.cert_key_reuseable
        }

        secret_properties {
            content_type = var.cert_content_type
        }
    }
}

# Generate Certificate
resource "azurerm_key_vault_certificate" "generated_cert" {
    count = local.is_cert_imported ? 0 : 1
        
    name          = var.cert_name
    key_vault_id  = data.azurerm_key_vault.vault.id
    tags          = var.tags

    certificate_policy {
        issuer_parameters {
            name = var.cert_issuer
        }

        key_properties {
            exportable = var.cert_key_exportable
            key_size   = var.cert_key_size
            key_type   = var.cert_key_type
            reuse_key  = var.cert_key_reuseable
        }

        lifetime_action {
            action {
                action_type = var.cert_lifetime_action_type
            }

            trigger {
                days_before_expiry = var.cert_lifetime_days_before_expiry
            }
        }

        secret_properties {
            content_type = var.cert_content_type
        }

        x509_certificate_properties {
            extended_key_usage = var.cert_extended_key_usage

            key_usage = var.cert_key_usage
            subject_alternative_names {
                dns_names = var.cert_dns_names
            }

            subject            = var.cert_subject
            validity_in_months = var.cert_validity_in_months
        }
    }
}