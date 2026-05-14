output "security_alerts_topic_arn" {
  value = aws_sns_topic.security_alerts.arn
}

output "securityhub_finding_aggregator_arn" {
  value = aws_securityhub_finding_aggregator.central.arn
}

output "guardduty_detector_id" {
  value = aws_guardduty_detector.main.id
}

output "access_analyzer_arn" {
  value = aws_accessanalyzer_analyzer.main.arn
}