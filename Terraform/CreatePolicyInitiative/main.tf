data "azurerm_subscription" "current" {}

provider "azurerm" {
    alias = "current"
    subscription_id = data.azurerm_subscription.current.subscription_id
}

module "PoliciesDefinition" {
    source = "../Modules/policies/policy-definition"
    providers = {
        azurerm = "azurerm.current"
    }

    policies = var.policies
}

module "InitiativeDefinition" {
    source = "../Modules/policies/initiative-definition"
    providers = {
        azurerm = "azurerm.current"
    }

    name = contains(module.PoliciesDefinition.policies_definition.*.name, var.initiative.name) ? var.initiative.name : var.initiative.name
    policy_type = var.initiative.policy_type
    display_name = var.initiative.display_name
    description = var.initiative.description
    metadata_file = var.initiative.metadata_file
    policy_definitions_file = var.initiative.policy_definitions_file
    parameters_file = var.initiative.parameters_file
}

module "PolicyAssigment" {
    source = "../Modules/policies/policy-assignment"
    providers = {
        azurerm = "azurerm.current"
    }

    name = var.assignment.name
    display_name = var.assignment.display_name
    description = var.assignment.description
    parameters_file = var.assignment.parameters_file

    policy_definition_id = module.InitiativeDefinition.initiative_definition.id
    scope = data.azurerm_subscription.current.id
}

