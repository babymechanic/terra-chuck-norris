resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.vpc_cidr_block
    gateway_id = "local"
  }
  tags = {
    Name = format("%s_%s", var.environment, "private_route_table")
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_region
  cidr_block        = var.private_subnet_cidr_block
  tags              = {
    Name = format("%s_%s", var.environment, "private_subnet")
  }
}

resource "aws_route_table_association" "private_subnet_to_table" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet.id
}
