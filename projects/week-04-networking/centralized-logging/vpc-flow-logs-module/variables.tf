variable "name" {
  description = "Name prefix for the flow log"
  type        = string
}

variable "vpc_id" {
  description = "ID of the Spoke VPC"
  type        = string
}

variable "log_destination_arn" {
  description = "ARN of the centralized S3 log bucket"
  type        = string
}

variable "traffic_type" {
  description = "Traffic type to capture: ACCEPT, REJECT, or ALL"
  type        = string
  default     = "ALL"
}