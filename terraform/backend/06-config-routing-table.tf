resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "public-route-config"
  }
}

resource "aws_route_table" "private-route-table-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.public-nat-gateway-1.id
  }

  tags = {
    Name = " private-route-config"
  }
}

resource "aws_route_table" "private-route-table-2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.public-nat-gateway-2.id
  }

  tags = {
    Name = " private-route-config"
  }
}