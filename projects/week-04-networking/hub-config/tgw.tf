resource "aws_ec2_transit_gateway" "hub" {
  description                     = "Main Regional Network Hub"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments  = "enable"

  tags = {
    Name = "hex-tgw-hub-01"
  }
}

output "tgw_id" {
  value = aws_ec2_transit_gateway.hub.id
}
