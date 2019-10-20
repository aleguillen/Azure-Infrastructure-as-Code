data "azurerm_subscription" "current" {}

resource "azurerm_policy_set_definition" "initiative" {
    name                = var.name
    policy_type         = var.policy_type
    display_name        = var.display_name
    description         = length(var.description) > 0 ? var.description : null

    management_group_id = length(var.management_group_id) > 0 ? var.management_group_id : null

    policy_definitions = "${replace(file(var.policy_definitions_file), "<current-subscription-id-replaced-at-runtime>", data.azurerm_subscription.current.subscription_id)}"

    parameters  = "${length(var.parameters_file) > 0 ? file(var.parameters_file) : null}"
    
    metadata    = "${length(var.metadata_file) > 0 ? file(var.metadata_file) : null}"
}
