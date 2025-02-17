variable "vpc_id" {
  description = "VPC ID to associate the NACL with"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to associate with NACL"
  type        = string
}
