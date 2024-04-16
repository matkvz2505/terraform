resource "aws_iam_user" "admin_users" {
  count = length(local.admin_users)
  name  = local.admin_users[count.index]

  tags = {
    Name = local.admin_users[count.index]

    Terraform = true
  }
}

resource "aws_iam_user_group_membership" "admin_membership" {
  count = length(local.admin_users)
  user  = aws_iam_user.admin_users[count.index].name
  groups = [var.group_admin_name]
}