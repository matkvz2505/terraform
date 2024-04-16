resource "aws_iam_user" "dba_users" {
  count = length(local.dba_users)
  name  = local.dba_users[count.index]

  tags = {
    Name = local.dba_users[count.index]

    Terraform = true
  }
}

resource "aws_iam_user_group_membership" "dba_membership" {
  count = length(local.dba_users)
  user  = aws_iam_user.dba_users[count.index].name
  groups = [var.group_dba_name]
}