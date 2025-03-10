

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

# Public Subnet CIDRs
variable "public-subnet-1a-cidr" {
  description = "CIDR block for the public web subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public-subnet-1b-cidr" {
  description = "CIDR block for the public app subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Private Subnet CIDRs
variable "private-app-subnet-1a-cidr" {
  description = "CIDR block for the private app subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private-app-subnet-1b-cidr" {
  description = "CIDR block for the private app subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private-db-subnet-1a-cidr" {
  description = "CIDR block for the private DB subnet"
  type        = string
  default     = "10.0.5.0/24"
}

variable "private-db-subnet-1b-cidr" {
  description = "CIDR block for the private DB subnet"
  type        = string
  default     = "10.0.6.0/24"
}

variable "private-eks-subnet-1a-cidr" {
  description = "CIDR block for the private eks subnet"
  type        = string
  default     = "10.0.7.0/24"
}

variable "private-eks-subnet-1b-cidr" {
  description = "CIDR block for the private eks subnet"
  type        = string
  default     = "10.0.8.0/24"
}

variable "availability_zones" {
  description = "List of Availability Zones in the region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = true
}

variable "aws_profile" {
  description = "The AWS CLI profile to use"
  type        = string
  default     = "default"  # Optionally set a default profile, or leave it empty
}

# variable "public_subnets" {
#   description = "List of public subnet IDs"
#   type        = list(string)
# }

# variable "private_subnets" {
#   description = "List of private subnet IDs"
#   type        = list(string)
  
# }


##EKS cluster
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Cluster Kubernetes version"
  type        = string
  default     = "1.31"
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the EKS endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs for public access to the EKS endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  description = "IPv4 CIDR block for EKS services"
  type        = string
  default     = "10.100.0.0/16"
}
