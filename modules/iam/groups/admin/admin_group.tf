resource "aws_iam_group" "admin" {
  name = "Admin"
  path = "/${var.admin_path}/"
}

resource "aws_iam_group_policy_attachment" "admin_attach" {
  group      = aws_iam_group.admin.name
  policy_arn = var.admin_policy_instance_arn
}