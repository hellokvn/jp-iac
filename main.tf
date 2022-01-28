module "networking" {
  source           = "./common/networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  security_groups  = local.security_groups
  public_sn_count  = 2
  private_sn_count = 3
  max_subnets      = 20
  public_cidrs     = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  db_subnet_group  = true
}

module "budget" {
  source = "./common/budget"
  email  = var.email
}

module "rds" {
  source                 = "./common/rds"
  dbname                 = var.dbname
  dbuser                 = var.dbuser
  dbpassword             = var.dbpassword
  db_subnet_group_name   = module.networking.db_subnet_group_name[0]
  vpc_security_group_ids = module.networking.db_security_group
}

module "route53" {
  source = "./common/route53"
  domain = var.domain
}


module "prod_static_website" {
  source     = "./prod/static-website"
  s3_domain = var.s3_domain
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_route53_main_zone_id = module.route53.aws_route53_main_zone_id
}
