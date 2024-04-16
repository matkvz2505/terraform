resource "aws_iam_group" "developer" {
  name = "Developer"
  path = "/${var.developer_path}/"
}

resource "aws_iam_group_policy_attachment" "developer_attach" {
  group      = aws_iam_group.developer.name
  policy_arn = var.developer_policy_arn
}

resource "aws_iam_group_policy_attachment" "developer_requested_region" {
  group      = aws_iam_group.developer.name
  policy_arn = var.developer_iam_requested_region_policy_arn
}

resource "aws_iam_group_policy_attachment" "developer_deny_delete" {
  group      = aws_iam_group.developer.name
  policy_arn = var.developer_iam_deny_delete_policy_arn
}