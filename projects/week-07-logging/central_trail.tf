resource "aws_cloudtrail" "org_trail" {
  name                          = "hex-org-audit-trail"
  s3_bucket_name                = var.log_archive_bucket_id # Pointing to the "Vault"
  is_organization_trail         = true                      # The "Magic" switch
  is_multi_region_trail         = true                      # No blind spots in other regions
  include_global_service_events = true                      # Catch IAM changes
  enable_log_file_validation    = true                      # Digital "Seal" for the logs

  tags = {
    Environment = "Governance"
  }
}