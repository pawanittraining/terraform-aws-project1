
output "public_subnet_ids" {
  description = "The IDs of the created public subnets"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the created private subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "public_subnet_cidrs" {
  description = "The CIDR blocks of the created public subnets"
  value       = aws_subnet.public_subnet[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "The CIDR blocks of the created private subnets"
  value       = aws_subnet.private_subnet[*].cidr_block
}

output "private_eks_subnet_ids" {
  value = [
    for subnet in aws_subnet.private_subnet : subnet.id if substr(subnet.tags["Name"], 0, 14) == "Private-eks-"
  ]
}



