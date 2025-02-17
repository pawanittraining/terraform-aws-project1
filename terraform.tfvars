region               = "us-east-1"
vpc_cidr             = "10.0.0.0/16"

# Public Subnet CIDRs
public-subnet-1a-cidr  = "10.0.1.0/24"
public-subnet-1b-cidr  = "10.0.2.0/24"

# Private Subnet CIDRs
private-app-subnet-1a-cidr = "10.0.3.0/24"
private-app-subnet-1b-cidr = "10.0.4.0/24"

#db 
#eks private subnets
private-db-subnet-1a-cidr = "10.0.5.0/24"
private-db-subnet-1b-cidr = "10.0.6.0/24"
#eks private subnets
private-eks-subnet-1a-cidr = "10.0.7.0/24"
private-eks-subnet-1b-cidr = "10.0.8.0/24"

availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true
aws_profile = "labcart4"