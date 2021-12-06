resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.21.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone     = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.22.0/24"
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet"
  }
}
