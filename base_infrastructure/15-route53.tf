#resource "aws_route53_zone" "hrapp-route53" {
#  name = "kensko-hr-management.link"
#    vpc {
 #   vpc_id = aws_vpc.hr-app-vpc.id
 # }

#}






resource "aws_route53_record" "hrapp-ns-1" {
  zone_id = var.zone_id
  name    = "hrapp-1"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-1.public_ip]
}

resource "aws_route53_record" "hrapp-ns-2" {
  zone_id = var.zone_id
  name    = "hrapp-2"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-2.public_ip]
}

resource "aws_route53_record" "hrapp-ns-3" {
  zone_id = var.zone_id
  name    = "hrapp-3"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-3.public_ip]
}

resource "aws_route53_record" "hrapp-ns-4" {
  zone_id =var.zone_id
  name    = "prometheus"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-4.public_ip]
}




resource "aws_route53_health_check" "hrapp-health-check" {
  zone_id           =var.zone_id
  #fqdn              = "kensko-hr-management.link"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "hrapp-health-check"
  }
}


#resource "aws_route53_zone_association" "hrapp-zone-association" {
#  zone_id = var.zone_id
#  vpc_id  = aws_vpc.hr-app-vpc.id
#}