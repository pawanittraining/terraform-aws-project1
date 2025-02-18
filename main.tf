
# Fetch availability zones for the region
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id              = module.vpc.vpc_id
  availability_zones   = data.aws_availability_zones.available.names
  public_subnet_configs = [
    {
      name       = "Public-Subnet-1a"
      cidr_block = var.public-subnet-1a-cidr
      availability_zone = "us-east-1a"
    },
    {
      name       = "Public-Subnet-1b"
      cidr_block = var.public-subnet-1b-cidr
      availability_zone = "us-east-1b"
    }
  ]
  private_subnet_configs = [
    {
      name       = "Private-app-Subnet-1a"
      cidr_block = var.private-app-subnet-1a-cidr
      availability_zone = "us-east-1a"
    },
    {
      name       = "Private-app-Subnet-1b"
      cidr_block = var.private-app-subnet-1b-cidr
      availability_zone = "us-east-1b"
    },
    {
      name       = "Private-DB-Subnet-1a"
      cidr_block = var.private-db-subnet-1a-cidr
      availability_zone = "us-east-1a"
    },
    {
      name       = "Private-DB-Subnet-1b"
      cidr_block = var.private-db-subnet-1b-cidr
      availability_zone = "us-east-1b"
    },
    {
      name       = "Private-eks-subnet-1a"
      cidr_block = var.private-eks-subnet-1a-cidr
      availability_zone = "us-east-1a"
    },
    {
      name       = "Private-eks-subnet-1b"
      cidr_block = var.private-eks-subnet-1b-cidr
      availability_zone = "us-east-1b"
    }
  ]
}


module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source          = "./modules/route_tables"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.subnets.public_subnet_ids
  private_subnets = module.subnets.private_subnet_ids  # Use the output here directly
  igw_id          = module.internet_gateway.igw_id
  enable_nat_gateway = false
}

# module "nat_gateway" {
#   source = "./modules/nat_gateway"
#   vpc_id = module.vpc.vpc_id
#   public_subnet_id = module.subnets.public_subnets[0]
#   enable_nat_gateway = var.enable_nat_gateway
# }

module "nacl" {
  source         = "./modules/nacl"
  vpc_id         = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_ids[0]
}

# Call IAM Role Module for EKS Master Role (Ensure this IAM module is properly defined and referenced)
# module "iam_role" {
#   source = "./modules/iam-role"
#   role_name = "eks_master_role"
# }

## Call EKS Cluster Module
module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name                     = var.cluster_name
  cluster_version                  = var.cluster_version
  public_subnets                   = module.subnets.public_subnet_ids
  cluster_endpoint_private_access  = var.cluster_endpoint_private_access
  cluster_endpoint_public_access   = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  cluster_service_ipv4_cidr        = var.cluster_service_ipv4_cidr

  vpc_id                           = module.vpc.vpc_id 
  depends_on = [
    module.subnets,
  ]
}
  #private_subnets                  = module.subnets.private_eks_subnet_ids