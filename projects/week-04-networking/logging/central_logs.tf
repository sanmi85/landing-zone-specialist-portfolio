data "aws_caller_identity" "current" {}

# Created immutable bucket
resource "aws_s3_bucket" "audit_logs" {
  bucket = "sanmi-central-audit-logs-${data.aws_caller_identity.current.account_id}"

    # To prevent accidental deletion
    lifecycle{ 
 prevent_destroy = true
    }
}

# Enabled versioning
resource "aws_s3_bucket_versioning" "logs_versioning" {
    bucket = "sanmi-central-audit-logs-${data.aws_caller_identity.current.account_id}"
    versioning_configuration{
        status = "Enabled"
    }
} 

# Introduced the specialist policy
resource "aws_s3_bucket_policy" "allow_org_logs"{
    bucket = aws_s3_bucket.audit_logs.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogDelivery"
        Effect = "Allow"
        Principal = { Service = "delivery.logs.amazonaws.com" }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.audit_logs.arn}/*"
        Condition = {
          StringEquals = {
            "aws:SourceOrgID" = "o-0scg53y7o1" # Sanmi's Org ID
          }
        }
      }
    ]
  })




}



