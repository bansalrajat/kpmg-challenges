resource "aws_eip" "nat_eip_b" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
      Name = "nat_eip_subnet_b"
  }
}

resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = aws_subnet.public_subnet_b.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
      Name = "nat_gw_subnet_b"
  }


}

resource "aws_eip" "nat_eip_c" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
      Name = "nat_eip_subnet_c"
  }
}

resource "aws_nat_gateway" "nat_gw_c" {
  allocation_id = aws_eip.nat_eip_c.id
  subnet_id     = aws_subnet.public_subnet_c.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
      Name = "nat_gw_subnet_c"
  }

}