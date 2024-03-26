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

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_public_subnet_region_1
  cidr_block        = var.public_subnet_cidr_block_1
  tags              = {
    Name = format("%s_%s", var.environment, "public_subnet_1")
  }
}

resource "aws_route_table_association" "public_subnet_to_table_1" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_1.id
}

resource "aws_eip" "public_nat_gateway_elastic_ip_1" {
  depends_on = [aws_internet_gateway.internet_gateway]
  tags       = {
    Name = format("%s_public_nat_gateway_elastic_ip_1", var.environment)
  }
}

resource "aws_nat_gateway" "public_nat_gateway_1" {
  allocation_id = aws_eip.public_nat_gateway_elastic_ip_1.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags          = {
    Name : format("%s_public_nat_gateway_1", var.environment)
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.aws_public_subnet_region_2
  cidr_block        = var.public_subnet_cidr_block_2
  tags              = {
    Name = format("%s_%s", var.environment, "public_subnet_2")
  }
}

resource "aws_route_table_association" "public_subnet_to_table_2" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_2.id
}

resource "aws_eip" "public_nat_gateway_elastic_ip_2" {
  depends_on = [aws_internet_gateway.internet_gateway]
  tags       = {
    Name = format("%s_public_nat_gateway_elastic_ip_2", var.environment)
  }
}

resource "aws_nat_gateway" "public_nat_gateway_2" {
  allocation_id = aws_eip.public_nat_gateway_elastic_ip_2.id
  subnet_id     = aws_subnet.public_subnet_2.id
  tags          = {
    Name : format("%s_public_nat_gateway_2", var.environment)
  }
}
