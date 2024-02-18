resource "aws_vpc" "vpc_tf" {
  cidr_block = var.cidr

}

resource "aws_subnet" "sub1_tf" {
  vpc_id                  = aws_vpc.vpc_tf.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "sub2_tf" {
  vpc_id                  = aws_vpc.vpc_tf.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

}


resource "aws_internet_gateway" "igw_tf" {
  vpc_id = aws_vpc.vpc_tf.id

}


resource "aws_route_table" "route_tf" {
  vpc_id = aws_vpc.vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_tf.id

  }

}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1_tf.id
  route_table_id = aws_route_table.route_tf.id

}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.sub2_tf.id
  route_table_id = aws_route_table.route_tf.id

}








