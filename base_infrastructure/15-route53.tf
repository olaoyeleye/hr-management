resource "aws_route53_zone" "hrapp-route53" {
  name = "kensko.com"
    vpc {
    vpc_id = aws_vpc.hr-app-vpc.id
  }

}


resource "aws_route53_record" "hrapp-ns-1" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-1.kensko.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-1.public_ip]
}

resource "aws_route53_record" "hrapp-ns-2" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-2.kensko.com"
  type    = "NS"
  ttl     = "30"
  records = [aws_instance.hr-app-2.public_ip]
}

resource "aws_route53_record" "hrapp-ns-3" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "hrapp-3.kensko.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.hr-app-3.public_ip]
}