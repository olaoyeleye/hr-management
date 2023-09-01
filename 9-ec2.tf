
resource "aws_instance" "hr-app-1" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_1_public.id
  associate_public_ip_address = true
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]
  tags = {
    Name = var.hr-app-name-1
  }
}


resource "aws_instance" "hr-app-2" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_1_public.id
associate_public_ip_address = true
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]

  tags = {
    Name = var.hr-app-name-2
  }
}


resource "aws_instance" "hr-app-3" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_2_public.id
associate_public_ip_address = true
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]

  tags = {
    Name = var.hr-app-name-3
  }
}

resource "aws_instance" "hr-app-4" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_2_public.id
associate_public_ip_address = true
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]

  tags = {
    Name = var.hr-app-name-4
  }
  user_data = <<EOF
#!/bin/bash

sudo apt update -y
sudo apt install -y

# install docker file
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
#  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7EA0A9C3F273FCD8
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo apt update -y
sudo usermod -aG docker $USER
sudo apt install git -y


EOF
}


resource "aws_instance" "hr-app-jump-server" {
  ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_2_public.id
associate_public_ip_address = true
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]

  tags = {
    Name = var.hr-app-jump-server
  }
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

sudo apt update -y
sudo apt install -y

# install docker file
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
#  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7EA0A9C3F273FCD8
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo apt update -y
sudo usermod -aG docker $USER
sudo apt install git -y


EOF
}



resource "aws_instance" "hr-app-5" {
   ami           = var.ami
  key_name      = var.key_name
  instance_type = "t2.micro"
   subnet_id = aws_subnet.subnet_3_private.id 
vpc_security_group_ids =[aws_security_group.hr-app-sg.id]

   tags = {
     Name =var.hr-app-name-5
   }
 }