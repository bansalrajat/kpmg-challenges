# Create Public subnet b 
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.public_subnet_b_az
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

# Create Public Route Table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

#Associate Public Route table  to subnet b
resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table.id
}


# Create Public subnet c

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_c_cidr
  availability_zone       = var.public_subnet_c_az
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-c"
  }
}

#Associate Public Route table  to subnet c

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_route_table.id
}


# Create Private subnet b

resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.private_subnet_b_cidr
  availability_zone       = var.private_subnet_b_az
  map_public_ip_on_launch = false

  tags =  {
    Name = "private-subnet-b"
  }
}

# Create private route table b
resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_b.id
  }

  tags = {
    Name = "private-route-table-b"
  }
}

#Associate Private Route table  to subnet b

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

# Create Private subnet c

resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.private_subnet_c_cidr
  availability_zone       = var.private_subnet_c_az
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-c"
  }
}

# Create private route table c

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_c.id
  }

  tags = {
    Name = "private-route-table"
  }
}

#Associate Public Route table  to subnet c

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_route_table_c.id
}

resource "aws_subnet" "db_subnet_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.db_subnet_b_cidr
  availability_zone       = var.db_subnet_b_az
  map_public_ip_on_launch = false

  tags = {
    Name = "db-subnet-b"
  }
}

resource "aws_subnet" "db_subnet_c" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.db_subnet_c_cidr
  availability_zone       = var.db_subnet_c_az
  map_public_ip_on_launch = false

  tags = {
    Name = "db-subnet-c"
  }
}