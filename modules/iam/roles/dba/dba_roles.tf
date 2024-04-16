data "aws_iam_policy_document" "dba_policy_assume_role" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "dba_iam_policy" {
  name = "${local.name}-${var.dba_path}-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:*",
          "dynamodb:*",
          "redshift:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "dba_iam_role_instance" {
  name               = "${local.name}-${var.dba_path}-role"
  path               = "/${var.dba_path}/"
  assume_role_policy = data.aws_iam_policy_document.dba_policy_assume_role.json
  managed_policy_arns = [ aws_iam_policy.dba_iam_policy.arn ]

  tags = {

    Terraform = true
  }
}
