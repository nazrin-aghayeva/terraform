resource "aws_security_group" "public-security-group" {
  vpc_id = aws_vpc.vpc.id
  name = "public-security-group"

  ingress {
    from_port = 80
    protocol  = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    to_port   = 80
  }

  egress {
    from_port = 0
    protocol  = "TCP"
    to_port   = 65535
    cidr_blocks = ["0.0.0.0/16"]
  }

}

resource "aws_security_group" "private-security-group" {
  vpc_id = aws_vpc.vpc.id
  name = "private-security-group"

  ingress {
    from_port = 80
    protocol  = "TCP"
    cidr_blocks = ["0.0.0.0/16"]
    to_port   = 80
  }

  egress {
    from_port = 80
    protocol  = "TCP"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/16"]
  }

}