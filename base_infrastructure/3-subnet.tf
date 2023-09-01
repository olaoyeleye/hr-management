

resource "aws_subnet" "subnet_1_public" {
  vpc_id            = aws_vpc.hr-app-vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = var.public_subnet_1_name
  }
}

resource "aws_subnet" "subnet_2_public" {
  vpc_id            = aws_vpc.hr-app-vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = var.public_subnet_2_name
  }
}

resource "aws_subnet" "subnet_3_private" {
  vpc_id            = aws_vpc.hr-app-vpc.id
  cidr_block        = var.private_subnet_3_cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = var.private_subnet_3_name
  }
}

resource "aws_db_subnet_group" "postgresdb-subnet" {
  name        = "postgresdb-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.subnet_3_private.id, aws_subnet.subnet_2_public.id]
  tags = {
    Name = "postgresdb-subnet"
  }
  
  }