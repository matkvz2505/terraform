resource "aws_iam_group" "serveless" {
  name = "Serveless"
  path = "/${var.serveless_path}/"
}

resource "aws_iam_group_policy_attachment" "serveless_attach" {
  group      = aws_iam_group.serveless.name
  policy_arn = var.serveless_policy_instance_arn
}