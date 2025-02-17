variable "vpc_id" {
  description = "VPC ID to associate the route table with"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID (optional)"
  type        = string
  default     = ""
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT Gateway routes"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}