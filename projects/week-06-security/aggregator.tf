# -----------------------------------
# Security Hub Cross-Region Aggregator
# -----------------------------------

resource "aws_securityhub_finding_aggregator" "central" {
  linking_mode = "ALL_REGIONS"
}

# -----------------------------------
# AWS Foundational Security Best Practices
# -----------------------------------

resource "aws_securityhub_standards_subscription" "aws_foundational" {
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/aws-foundational-security-best-practices/v/1.0.0"
}

# -----------------------------------
# CIS AWS Foundations Benchmark
# -----------------------------------

resource "aws_securityhub_standards_subscription" "cis" {
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/cis-aws-foundations-benchmark/v/1.4.0"
}