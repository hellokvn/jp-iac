resource "aws_db_instance" "psql" {
  engine                  = "postgres"
  engine_version          = "12.9"
  instance_class          = "db.t2.micro"
  identifier              = "jp-psql-instance"
  storage_type            = "gp2"
  allocated_storage       = 20
  max_allocated_storage   = 200
  backup_retention_period = 7
  skip_final_snapshot     = true
  publicly_accessible     = true
  copy_tags_to_snapshot   = true
  multi_az                = false
  name                    = var.dbname
  username                = var.dbuser
  password                = var.dbpassword
  db_subnet_group_name    = var.db_subnet_group_name
  vpc_security_group_ids  = var.vpc_security_group_ids

  tags = {
    Name = "Production"
  }
}
