resource "aws_subnet" "public-subnet-1" {
  cidr_block = "10.0.21.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block = "10.0.11.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block = "10.0.22.0/24"
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block = "10.0.12.0/24"
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}
