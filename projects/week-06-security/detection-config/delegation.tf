resource "aws_guardduty_organization_admin_account" "security_delegate" {
  admin_account_id = var.security_account_id
}

resource "aws_securityhub_organization_admin_account" "security_hub_delegate" {
  admin_account_id = var.security_account_id
}