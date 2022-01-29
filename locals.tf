locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public_sg"
      description = "Security group for Public Access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        customTcp = {
          from        = 9701
          to          = 9702
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
      }
    }
    rds = {
      name        = "rds_sg"
      description = "Security group for RDS"
      ingress = {
        allTraffic = {
          from        = 0
          to          = 0
          protocol    = -1
          cidr_blocks = [var.access_ip]
        }
        postgres = {
          from        = 5432
          to          = 5432
          protocol    = "tcp"
          cidr_blocks = [local.vpc_cidr]
        }
      }
    }
  }
}
