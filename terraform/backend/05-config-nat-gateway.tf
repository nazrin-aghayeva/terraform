resource "aws_nat_gateway" "public-nat-gateway-1" {
  subnet_id = aws_subnet.public-subnet-1.id
  depends_on = [aws_internet_gateway.internet-gateway]

  tags = {
    Name ="public-nat-gateway-1"
  }
}

resource "aws_nat_gateway" "public-nat-gateway-2" {
  subnet_id = aws_subnet.public-subnet-2.id
  depends_on = [aws_internet_gateway.internet-gateway]

  tags = {
    Name ="public-nat-gateway-2"
  }
}