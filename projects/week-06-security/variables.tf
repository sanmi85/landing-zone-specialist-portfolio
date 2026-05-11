# The "Sheriff's Office" - Where the security brain lives
variable "security_account_id" {
  description = "The 12-digit ID of the delegated Security/Audit account"
  type        = string
  default     = "643537035424"
}



# The "Organization ID" - To ensure only YOUR accounts are in the circle of trust
variable "organization_id" {
  description = "The AWS Organization ID (e.g., o-xxxxxxxxxx)"
  type        = string
  default     = "o-0scg53y7o1" #get this from the Management Account
}


variable "aws_region" {
    description = "The region where security service will be centered"
    type        = string
    default     ="us-east-2"
}