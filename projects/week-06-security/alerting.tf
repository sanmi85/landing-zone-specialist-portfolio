# -----------------------------------
# SNS Topic - Phone Line
# -----------------------------------

resource "aws_sns_topic" "security_alerts" {
  name = "high-critical-securityhub-alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# -----------------------------------
# EventBridge Rule - Filter
# -----------------------------------

resource "aws_cloudwatch_event_rule" "high_critical_findings" {
  name        = "high-critical-securityhub-findings"
  description = "Triggers when Security Hub receives HIGH or CRITICAL active findings"

  event_pattern = jsonencode({
    source        = ["aws.securityhub"]
    "detail-type" = ["Security Hub Findings - Imported"]
    detail = {
      findings = {
        Severity = {
          Label = ["HIGH", "CRITICAL"]
        }
        Workflow = {
          Status = ["NEW"]
        }
        RecordState = ["ACTIVE"]
      }
    }
  })
}

# -----------------------------------
# Connect Filter to Phone Line
# -----------------------------------

resource "aws_cloudwatch_event_target" "send_to_sns" {
  rule      = aws_cloudwatch_event_rule.high_critical_findings.name
  target_id = "SendHighCriticalFindingsToSNS"
  arn       = aws_sns_topic.security_alerts.arn
}

# -----------------------------------
# Allow EventBridge to Publish to SNS
# -----------------------------------

resource "aws_sns_topic_policy" "allow_eventbridge" {
  arn = aws_sns_topic.security_alerts.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEventBridgePublish"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "sns:Publish"
        Resource = aws_sns_topic.security_alerts.arn
      }
    ]
  })
}
