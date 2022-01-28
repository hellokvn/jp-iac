output "ec2_public_dns" {
  value = aws_instance.node.public_dns
}

output "ec2_public_ip" {
  value = aws_eip.eip.public_ip
}

output "ec2_tag_name" {
  value = aws_instance.node.tags.Name
}

output "ec2_key_pair_id" {
  value = aws_key_pair.key_pair.id
}
