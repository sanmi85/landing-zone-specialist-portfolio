resource "aws_vpc_endpoint_service" "hidden_service" {
  acceptance_required        = true
  network_load_balancer_arns = [aws_lb.internal_nlb.arn]

  # Whitelist of trusted consumer accounts
  allowed_principals = [
    "arn:aws:iam::123456789012:root",
  ]

  tags = { Name = "sanmi-vault-service" }
}