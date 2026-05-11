resource "aws_flow_log" "spoke_logs" {
  vpc_id               = "vpc-0c80108805bdf5d97" 
  traffic_type         = "ALL"
  log_destination_type = "s3"
  log_destination      = "arn:aws:s3:::sanmi-central-audit-logs"

  tags = {
    Name = "spoke-vpc-flow-logs"
  }
}