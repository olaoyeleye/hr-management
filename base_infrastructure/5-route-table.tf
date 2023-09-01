resource "aws_route_table" "hr-app-public-rt" {
  vpc_id = aws_vpc.hr-app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hr-app-gw.id
  }

  tags = {
    Name = "hr-app-public-rt"

  }
}



resource "aws_route_table" "hr-app-private-rt" {
  vpc_id = aws_vpc.hr-app-vpc.id

  tags = {
    Name = "hr-app-private-rt"
  }
}
 