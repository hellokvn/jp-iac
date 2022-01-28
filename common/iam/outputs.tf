output "code_deploy_role_arn" {
  value = aws_iam_role.code_deploy_role.arn
}

output "code_deploy_user_access_key" {
  value = aws_iam_access_key.code_deploy_user_access_key.id
}

output "code_deploy_user_secret_access_key" {
  value     = aws_iam_access_key.code_deploy_user_access_key.secret
  sensitive = false
}

output "code_deploy_role_instance_profile_name" {
  value = aws_iam_instance_profile.code_deploy_role_instance_profile.name
}
