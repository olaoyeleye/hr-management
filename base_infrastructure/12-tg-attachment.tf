
resource "aws_lb_target_group_attachment" "tg-attachment-1" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.HR-APP-Machine-1.id
  port             = 80
  depends_on = [
    aws_lb_target_group.tg-all.id
  ]
}

resource "aws_lb_target_group_attachment" "tg-attachment-2" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.HR-APP-Machine-2.id
  port             = 80
    depends_on = [
    aws_lb_target_group.tg-all.id
  ]
}

resource "aws_lb_target_group_attachment" "tg-attachment-3" {
  target_group_arn = aws_lb_target_group.tg-all.arn
  target_id        = aws_instance.HR-APP-Machine-3.id
  port             = 80
    depends_on = [
    aws_lb_target_group.tg-all.id
  ]
}