output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.gw[0].id
}
