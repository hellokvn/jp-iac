
output "aws_route53_main_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "aws_route53_main_ns" {
  value = aws_route53_zone.main.name_servers
}
