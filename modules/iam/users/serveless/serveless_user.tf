resource "aws_iam_user" "serveless_users" {
  count = length(local.serveless_users)
  name  = local.serveless_users[count.index]

  tags = {
    Name = local.serveless_users[count.index]

    Terraform = true
  }
}

resource "aws_iam_user_group_membership" "serveless_membership" {
  count = length(local.serveless_users)
  user  = aws_iam_user.serveless_users[count.index].name
  groups = [var.group_serveless_name]
}