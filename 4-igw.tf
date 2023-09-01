resource "aws_internet_gateway" "hr-app-gw" {
  vpc_id = aws_vpc.hr-app-vpc.id

  tags = {
    Name = "hr-app-gw"
  }
}