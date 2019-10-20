variable "policies" {
    type = list(object({
        name = string
        policy_type = string
        mode = string
        display_name = string
        description = string
        management_group_id = string
        metadata_file = string
        policy_rule_file = string
        parameters_file = string
    }))
    description = "The list of policies definition to create."
    default     = [
        {
            name                = "policy1-enforce-resource-groups-tag"
            policy_type         = "Custom"
            mode                = "All"
            display_name        = "policy1 enforce resource groups tag"
            description         = "policy1 enforce resource groups tag description"
            metadata_file       = "./policies-definition/policy1/metadata.json"
            policy_rule_file    = "./policies-definition/policy1/policy-rule.json"
            parameters_file     = "./policies-definition/policy1/parameters.json"
            management_group_id = ""
        },
        {
            name                = "policy2-enforced-locations"
            policy_type         = "Custom"
            mode                = "All"
            display_name        = "policy2 enforced locations"
            description         = "policy2 enforced locations description"
            metadata_file       = "./policies-definition/policy2/metadata.json"
            policy_rule_file    = "./policies-definition/policy2/policy-rule.json"
            parameters_file     = "./policies-definition/policy2/parameters.json"
            management_group_id = ""
        }
    ]
}

variable "initiative" {
    type        = map
    description = "The list of initiatives to create."
    default     = {
        name                        = "initiative1-enforce-location-and-resource-groups-tag"
        policy_type                 = "Custom"
        display_name                = "initiative1 enforce location and resource groups tag"
        description                 = "initiative1 enforce location and resource groups tag description"
        metadata_file               = "./initiative-definition/metadata.json"
        policy_definitions_file     = "./initiative-definition/policy-definitions.json"
        parameters_file             = "./initiative-definition/parameters.json"
    }
}

variable "assignment" {
    type        = map
    description = "The policy assigment definition using the current subscription and the cuurrent initiative created."
    default     = {
            name                        = "assigment1-enforce-location-and-resource-groups-tag"
            display_name                = "assigment1 enforce location and resource groups tag"
            description                 = "assigment1 enforce location and resource groups tag description"
            parameters_file             = "./policy-assigment/parameters.json"
    }
}
