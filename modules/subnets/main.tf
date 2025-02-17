resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_configs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_configs[count.index].cidr_block
  availability_zone       = var.public_subnet_configs[count.index].availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_configs[count.index].name
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnet_configs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_configs[count.index].cidr_block
  availability_zone       = var.private_subnet_configs[count.index].availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet_configs[count.index].name
  }
}
