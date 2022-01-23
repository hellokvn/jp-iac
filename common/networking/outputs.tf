output "vpc_id" {
  value = aws_vpc.kvnvo_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.kvnvo_rds_subnet_group.*.name
}

output "db_security_group" {
  value = [aws_security_group.kvnvo_sg["rds"].id]
}

output "public_sg" {
  value = aws_security_group.kvnvo_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.kvnvo_public_subnet.*.id
}
