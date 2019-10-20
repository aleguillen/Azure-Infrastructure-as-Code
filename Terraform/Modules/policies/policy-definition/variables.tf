variable "policies" {
    type        = list(object({
        name                = string
        policy_type         = string
        mode                = string
        display_name        = string
        description         = string
        management_group_id = string
        metadata_file       = string
        policy_rule_file    = string
        parameters_file     = string
    }))
    description = "The list of policies definition to create."
}



# variable "name" {
#     type        = string
#     description = "The name of the policy definition. Changing this forces a new resource to be created."
# }

# variable "policy_type" {
#     type        = string
#     description = "The policy type. The value can be 'BuiltIn', 'Custom' or 'NotSpecified'. Changing this forces a new resource to be created."
# }

# variable "mode" {
#     type        = string
#     description = "The policy mode that allows you to specify which resource types will be evaluated. The value can be All, Indexed or NotSpecified. Changing this resource forces a new resource to be created."
# }

# variable "display_name" {
#     type        = string
#     description = "The display name of the policy definition."
# }

# variable "description" {
#     type        = string
#     description = "The description of the policy definition."
#     default     = ""
# }

# variable "management_group_id" {
#     type        = string
#     description = "The ID of the Management Group where this policy should be defined. Changing this forces a new resource to be created."
#     default     = ""
# }

# variable "policy_rule_file" {
#     type        = string
#     description = "The path location of the policy rule for the policy definition. This is a json file representing the rule that contains an if and a then block."
#     default     = ""
# }

# variable "metadata_file" {
#     type        = string
#     description = "The path location of metadata for the policy definition. This is a json file representing additional metadata that should be stored with the policy definition."
#     default     = ""
# }

# variable "parameters_file" {
#     type        = string
#     description = "The path location of Parameters for the policy definition. This field is a json file that allows you to parameterize your policy definition."
#     default     = ""
# }


