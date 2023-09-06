resource "aws_lb_target_group" "tg-all" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id            = aws_vpc.hr-app-vpc.id
}



resource "aws_lb_target_group_attachment" "tg-attachment-1" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.hr-app-name-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment-2" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.hr-app-name-2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment-3" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.hr-app-name-3.id
  port             = 80
}