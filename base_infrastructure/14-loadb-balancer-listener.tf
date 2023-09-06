resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_lb.hr-app-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg-all.arn   //"${aws_alb_target_group.group.arn}"
    type             = "forward"
  }
}