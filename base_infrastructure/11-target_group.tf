resource "aws_lb_target_group" "tg-all" {
  name     = "hrapp-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id            = aws_vpc.hr-app-vpc.id
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 80
  }
}

