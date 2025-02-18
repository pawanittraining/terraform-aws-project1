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
# Output the EKS Cluster details
output "eks_cluster_name" {
  value = module.eks_cluster
}

output "eks_cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_arn" {
  value = module.eks_cluster.cluster_arn
}

output "eks_master_role_arn" {
  value = module.eks_cluster.eks_master_role_arn
  description = "The ARN of the IAM role created for the EKS cluster"
}