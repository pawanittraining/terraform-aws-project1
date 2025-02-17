variable "vpc_id" {
  description = "VPC ID to place the NAT Gateway in"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to place the NAT Gateway in"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = true
}
