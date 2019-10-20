resource "azurerm_policy_definition" "policy" {
    count = length(var.policies)

    name                = var.policies[count.index].name
    policy_type         = var.policies[count.index].policy_type
    mode                = var.policies[count.index].mode
    display_name        = var.policies[count.index].display_name
    
    description         = length(var.policies[count.index].description) > 0 ? var.policies[count.index].description : null

    management_group_id = length(var.policies[count.index].management_group_id) > 0 ? var.policies[count.index].management_group_id : null

    policy_rule = "${length(var.policies[count.index].policy_rule_file) > 0 ? file(var.policies[count.index].policy_rule_file) : null}"

    parameters  = "${length(var.policies[count.index].parameters_file) > 0 ? file(var.policies[count.index].parameters_file) : null}"
    
    metadata    = "${length(var.policies[count.index].metadata_file) > 0 ? file(var.policies[count.index].metadata_file) : null}"

}