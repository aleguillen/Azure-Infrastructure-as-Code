locals {
    # Generating and setting Resource Group Name
    rg_name   = "${var.prefix}-rg"

    # Generating Unique String based on Resource Group Id
    unique_string = "${substr(md5(join("", [data.azurerm_subscription.current.id, "/resourceGroups/", local.rg_name])), 0, 5)}"

    # Generating Key Vault Name
    kv_auto_name = "${var.prefix}-${local.unique_string}-kv"

    # Setting Key Vault Name
    kv_name = "${length(var.kv_name) == 0 ? local.kv_auto_name : var.kv_name}"
}