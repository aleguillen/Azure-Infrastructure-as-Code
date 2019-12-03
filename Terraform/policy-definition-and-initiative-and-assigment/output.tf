output "policies_definition" {
  value = module.PoliciesDefinition.policies_definition
}

output "current_subscription" {
  value = "${data.azurerm_subscription.current}"
}

output "initiative_definition" {
  value = module.InitiativeDefinition.initiative_definition
}

output "policy_assignment" {
  value = module.PolicyAssigment.policy_assignment
}
