resource "aws_codedeploy_app" "web_app" {
  compute_platform = "Server"
  name             = "web_code_deploy_app"
}

resource "aws_codedeploy_deployment_group" "web_production_group" {
  deployment_group_name  = "web_production_group"
  app_name               = aws_codedeploy_app.web_app.name
  service_role_arn       = var.code_deploy_role_arn
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  deployment_style {
    deployment_type = "IN_PLACE"
  }

  auto_rollback_configuration {
    enabled = false
  }

  ec2_tag_set {
    ec2_tag_filter {
      type  = "KEY_AND_VALUE"
      key   = "Name"
      value = var.ec2_prod_tag_name
    }
  }
}