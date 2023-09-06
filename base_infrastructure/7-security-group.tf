resource "aws_security_group" "hr-app-sg" {
  name        = "hr-app-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hr-app-vpc.id

  ingress {
    description = "TLS from SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }

  ingress {
    description = "TLS from postgressDB"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }

  ingress {
    description = "TLS from HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }
  ingress {
    description = "TLS from HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }
  ingress {
    description = "TLS for Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_name
  }
}



resource "aws_security_group" "hr-app-load-balancer-sg" {
  name        = "hr-app-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hr-app-vpc.id

   

  ingress {
    description = "TLS from HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }
  ingress {
    description = "TLS from HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #[aws_vpc.hr-app-vpc.cidr_block]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_name
  }
}