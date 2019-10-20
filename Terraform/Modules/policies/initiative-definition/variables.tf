variable "name" {
    type        = string
    description = "The name of the policy set definition (initiative). Changing this forces a new resource to be created."
}

variable "policy_type" {
    type        = string
    description = "The policy type. The value can be BuiltIn or Custom. Changing this forces a new resource to be created."
}

variable "display_name" {
    type        = string
    description = "The display name of the policy set definition (initiative)."
}

variable "policy_definitions_file" {
    type        = string
    description = "The path location of the policy rule for the policy set definition (initiative). This is a json file representing the rule that contains an if and a then block."
} 

variable "description" {
    type        = string
    description = "The description of the policy set definition (initiative)."
    default     = ""
}

variable "management_group_id" {
    type        = string
    description = "The ID of the Management Group where this policy should be defined. Changing this forces a new resource to be created."
    default     = ""
}

variable "metadata_file" {
    type        = string
    description = "The path location of metadata for the policy set definition (initiative). This is a json file representing additional metadata that should be stored with the policy definition."
    default     = ""
}

variable "parameters_file" {
    type        = string
    description = "The path location of Parameters for the policy set definition (initiative). This field is a json file that allows you to parameterize your policy definition."
    default     = ""
}

