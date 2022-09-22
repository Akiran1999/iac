resource "aws_network_acl" "demo-nacl" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = "Demo-Nacl"
  }
}

resource "aws_network_acl_rule" "demo-nacl-rule" {
  network_acl_id = aws_network_acl.demo-nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "45.112.30.123/32"
  from_port      = 22
  to_port        = 22

}

resource "aws_network_acl_rule" "demo-nacl-rule-2" {
  network_acl_id = aws_network_acl.demo-nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "45.112.30.123/32"
  from_port      = 22
  to_port        = 22

}


resource "aws_network_acl_association" "demo-acl-sub" {
  network_acl_id = aws_network_acl.demo-nacl.id
  subnet_id      = aws_subnet.pub_subnet1.id
}