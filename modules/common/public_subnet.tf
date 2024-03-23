resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags   = {
    Name = format("%s_%s", var.environment, "internet_gateway")
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = format("%s_%s", var.environment, "public_route_table")
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_subnet_region
  cidr_block        = var.public_subnet_cidr_block
  tags              = {
    Name = format("%s_%s", var.environment, "public_subnet")
  }
}

resource "aws_route_table_association" "public_subnet_to_table" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet.id
}