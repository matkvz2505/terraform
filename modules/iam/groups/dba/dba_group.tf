resource "aws_iam_group" "dba" {
  name = "DBA"
  path = "/${var.dba_path}/"
}

resource "aws_iam_group_policy_attachment" "dba_attach" {
  group      = aws_iam_group.dba.name
  policy_arn = var.dba_policy_instance_arn
}