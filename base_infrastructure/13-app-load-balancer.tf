resource "aws_lb" "hr-app-load-balancer" {
  name               = "hr-app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hr-app-load-balancer-sg.id]
  subnets            = ["{aws_subnet.subnet_*_public.id}"]

}


