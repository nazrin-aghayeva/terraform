resource "aws_nat_gateway" "public-nat-gateway" {
  subnet_id = aws_subnet.public-subnet.id
  depends_on = [aws_internet_gateway.internet-gateway]

  tags = {
    Name ="public-nat-gateway"
  }
}