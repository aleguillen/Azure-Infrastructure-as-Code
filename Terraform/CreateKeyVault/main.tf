#Fetch current user info using the AZ cli for Key Vault Access Policies
data "external" "az_account" {
  program = ["az","ad","signed-in-user","show","--query","{displayName: displayName,objectId: objectId,objectType: objectType}"]
}

# Creates Resource Group and Key Vault 
module "KeyVault" {
    source = "../Modules/key-vault/vault"

    prefix = var.prefix
    tags = var.tags
    location = var.location

    ap_object_ids = [
        data.external.az_account.result.objectId
    ]
}

# Imports a Certificate to Key Vault
module "KeyVaultCert" {
    source = "../Modules/key-vault/certificate"

    tags = var.tags
    
    rg_name = module.KeyVault.resource_group.name
    kv_name = module.KeyVault.vault.name

    cert_name = "${var.cert_name}-imported"

    # Import Cert variables:
    cert_path = var.cert_path
    cert_password = var.cert_password
}

# Generates Certificate in Key vault 
module "KeyVaultGenCert" {
    source = "../Modules/key-vault/certificate"

    tags = var.tags
    
    rg_name = module.KeyVault.resource_group.name
    kv_name = module.KeyVault.vault.name

    cert_name = "${var.cert_name}-generated"

    # Generate Cert variables:
    cert_subject = var.cert_subject
}
