resource "aws_lb_target_group" "tg-all" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id            = aws_vpc.hr-app-vpc.id
}


