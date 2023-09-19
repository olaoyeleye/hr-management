resource "aws_route53_zone" "hrapp-route53" {
  name = "kensko-hr-management-app.link"
    vpc {
    vpc_id = aws_vpc.hr-app-vpc.id
  }

}









resource "aws_route53_record" "hrapp-ns-1" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-1.kensko-hr-management.link"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-1.public_ip]
}

resource "aws_route53_record" "hrapp-ns-2" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-2.kensko-hr-management.link"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-2.public_ip]
}

resource "aws_route53_record" "hrapp-ns-3" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-3.kensko-hr-management.link"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-3.public_ip]
}

resource "aws_route53_record" "hrapp-ns-4" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "prometheus.kensko-hr-management.link"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-4.public_ip]
}




resource "aws_route53_health_check" "hrapp-health-check" {
  fqdn              = "kensko-hr-management.link"
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
#  zone_id = aws_route53_zone.hrapp-route53.zone_id
#  vpc_id  = aws_vpc.hr-app-vpc.id
#}