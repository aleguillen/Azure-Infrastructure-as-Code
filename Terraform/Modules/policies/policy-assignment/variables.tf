variable "name" {
    type        = string
    description = "The name of the Policy Assignment. Changing this forces a new resource to be created."
}

variable "scope" {
    type        = string
    description = "The Scope at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. /subscriptions/00000000-0000-0000-000000000000 or a Resource Group e.g./subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup). Changing this forces a new resource to be created."
}

variable "policy_definition_id" {
    type        = string
    description = "The ID of the Policy Definition to be applied at the specified Scope."
}

variable "display_name" {
    type        = string
    description = "A friendly display name to use for this Policy Assignment. Changing this forces a new resource to be created."
    default     = ""
}

variable "description" {
    type        = string
    description = "A description to use for this Policy Assignment. Changing this forces a new resource to be created."
    default     = ""
}

variable "parameters_file" {
    type        = string
    description = "The path location of Parameters for the policy set definition (initiative). This field is a json file that allows you to parameterize your policy definition."
    default     = ""
}

variable "not_scopes" {
    type        = list(string)
    description = "A list of the Policy Assignment's excluded scopes. The list must contain Resource IDs (such as Subscriptions e.g. /subscriptions/00000000-0000-0000-000000000000 or Resource Groups e.g./subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup)."
    default     = []
}

