output "aws_route53_main_ns" {
  value = module.route53.aws_route53_main_ns
}

output "aws_rds_endpoint" {
  value = module.rds.db_endpoint
}
