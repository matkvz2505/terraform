resource "aws_iam_user" "developer_users" {
  count = length(local.developer_users)
  name  = local.developer_users[count.index]

  tags = {
    Name = local.developer_users[count.index]

    Terraform = true
  }
}

resource "aws_iam_user_group_membership" "developer_membership" {
  count = length(local.developer_users)
  user  = aws_iam_user.developer_users[count.index].name
  groups = [var.group_developer_name]
}