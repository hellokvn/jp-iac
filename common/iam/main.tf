resource "aws_iam_group_policy" "code_deploy_policy" {
  name   = "code_deploy_policy"
  group  = aws_iam_group.code_deploy_group.name
  policy = file("./common/iam/code-deploy-policy.json")
}

resource "aws_iam_group" "code_deploy_group" {
  name = "code_deploy_group"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "code_deploy_user" {
  user = aws_iam_user.code_deploy_user.name

  groups = [
    aws_iam_group.code_deploy_group.name,
  ]
}
resource "aws_iam_access_key" "code_deploy_user_access_key" {
  user = aws_iam_user.code_deploy_user.name
}

resource "aws_iam_user" "code_deploy_user" {
  name          = "code_deploy_user"
  force_destroy = true
}

resource "aws_iam_role_policy" "code_deploy_role_policy" {
  name   = "code_deploy_role_policy"
  role   = aws_iam_role.code_deploy_role.id
  policy = file("./common/iam/policy.json")
}

resource "aws_iam_role" "code_deploy_role" {
  name = "code_deploy_role"

  assume_role_policy = file("./common/iam/trust-relationship.json")
}

resource "aws_iam_instance_profile" "code_deploy_role_instance_profile" {
  name = "code_deploy_role_instance_profile"
  role = aws_iam_role.code_deploy_role.name
}

