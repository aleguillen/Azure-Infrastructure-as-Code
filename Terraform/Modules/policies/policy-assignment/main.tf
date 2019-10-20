resource "azurerm_policy_assignment" "assigment" {
    
    name                 = var.name
    scope                = var.scope
    policy_definition_id = var.policy_definition_id

    display_name         = length(var.display_name) > 0 ? var.display_name : null

    description         = length(var.description) > 0 ? var.description : null

    parameters  = "${length(var.parameters_file) > 0 ? file(var.parameters_file) : null}"
    
    not_scopes    = var.not_scopes
}
