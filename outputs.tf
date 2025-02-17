# outputs.tf

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.subnets.private_subnet_ids
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.internet_gateway.igw_id
}

# output "nat_gateway_id" {
#   description = "NAT Gateway ID"
#   value       = module.nat_gateway.nat_gateway_id
# }

output "nacl_id" {
  description = "Network ACL ID"
  value       = module.nacl.nacl_id
}
