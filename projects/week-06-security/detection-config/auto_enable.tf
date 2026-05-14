resource "aws_guardduty_organization_configuration" "gd_auto_enable" {
  auto_enable      = true
  detector_id      = aws_guardduty_detector.security_detector.id
  
  datasources {
    s3_logs {
      auto_enable = true
    }
  }
}

resource "aws_securityhub_organization_configuration" "sh_auto_enable" {
  auto_enable = true
}