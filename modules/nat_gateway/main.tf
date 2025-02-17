resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
 
}

resource "aws_nat_gateway" "gw" {
  count = var.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "main-nat-gateway"
  }
}
