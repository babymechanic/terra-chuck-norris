resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("%s_%s", var.environment, "private_route_table")
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_public_subnet_region_1
  cidr_block        = var.private_subnet_cidr_block_1
  tags              = {
    Name = format("%s_%s", var.environment, "private_subnet_1")
  }
}

resource "aws_route_table_association" "private_subnet_1_to_table" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet_1.id
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_public_subnet_region_2
  cidr_block        = var.private_subnet_cidr_block_2
  tags              = {
    Name = format("%s_%s", var.environment, "private_subnet_2")
  }
}

resource "aws_route_table_association" "private_subnet_2_to_table" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet_2.id
}
