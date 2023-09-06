resource "aws_route53_zone" "hrapp-route53" {
  name = "hrapp-kensko.com"
    vpc {
    vpc_id = aws_vpc.hr-app-vpc.id
  }

}


resource "aws_route53_record" "hrapp-ns" {
  zone_id = aws_route53_zone.hrapp-route53.zone_id
  name    = "dev.hrapp-kensko.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.hrapp-route53.name_servers
}

#resource "aws_route53_zone_association" "secondary" {
 # zone_id = aws_route53_zone.hrapp-route53.zone_id
 # vpc_id  = aws_vpc.hr-app-vpc.id
#}