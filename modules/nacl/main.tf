resource "aws_network_acl" "main" {
  vpc_id = var.vpc_id

  egress {
    rule_no     = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  ingress {
    rule_no     = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "main-nacl"
  }
}

resource "aws_network_acl_association" "main" {
  subnet_id      = var.public_subnet_id
  network_acl_id = aws_network_acl.main.id
}
