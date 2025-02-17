variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones to distribute the subnets"
  type        = list(string)
}

variable "public_subnet_configs" {
  description = "A list of public subnet configurations"
  type = list(object({
    name        = string
    cidr_block  = string
    availability_zone = string
  }))
}

variable "private_subnet_configs" {
  description = "A list of private subnet configurations"
  type = list(object({
    name        = string
    cidr_block  = string
    availability_zone = string
  }))
}
