variable "aws_region" {
  description = "AWS region for the centralized log bucket"
  type        = string
}

variable "bucket_name" {
  description = "Name of the centralized S3 log bucket"
  type        = string
}

variable "organization_id" {
  description = "AWS Organization ID, for example o-xxxxxxxxxx"
  type        = string
}