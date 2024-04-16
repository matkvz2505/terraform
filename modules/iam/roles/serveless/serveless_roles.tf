data "aws_iam_policy_document" "serveless_policy_assume_role" {
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

resource "aws_iam_policy" "serveless_iam_policy" {
  name = "${local.name}-${var.serveless_path}-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "apigateway:*"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:apigateway:*::/*"
      },
      {
        Action = [
          "execute-api:Invoke",
          "execute-api:ManageConnections"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:execute-api:*:*:*"
      },
      {
        Action = [
          "cloudformation:DescribeChangeSet",
          "cloudformation:DescribeStackResources",
          "cloudformation:DescribeStacks",
          "cloudformation:GetTemplate",
          "cloudformation:ListStackResources",
          "cloudwatch:*",
          "cognito-identity:ListIdentityPools",
          "cognito-sync:GetCognitoEvents",
          "cognito-sync:SetCognitoEvents",
          "dynamodb:*",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "events:*",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:ListRoles",
          "iam:PassRole",
          "iot:AttachPrincipalPolicy",
          "iot:AttachThingPrincipal",
          "iot:CreateKeysAndCertificate",
          "iot:CreatePolicy",
          "iot:CreateThing",
          "iot:CreateTopicRule",
          "iot:DescribeEndpoint",
          "iot:GetTopicRule",
          "iot:ListPolicies",
          "iot:ListThings",
          "iot:ListTopicRules",
          "iot:ReplaceTopicRule",
          "kinesis:DescribeStream",
          "kinesis:ListStreams",
          "kinesis:PutRecord",
          "kms:ListAliases",
          "lambda:*",
          "logs:*",
          "s3:*",
          "sns:ListSubscriptions",
          "sns:ListSubscriptionsByTopic",
          "sns:ListTopics",
          "sns:Publish",
          "sns:Subscribe",
          "sns:Unsubscribe",
          "sqs:ListQueues",
          "sqs:SendMessage",
          "tag:GetResources",
          "xray:PutTelemetryRecords",
          "xray:PutTraceSegments"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "serveless_iam_role_instance" {
  name               = "${local.name}-${var.serveless_path}-role"
  path               = "/${var.serveless_path}/"
  assume_role_policy = data.aws_iam_policy_document.serveless_policy_assume_role.json
  managed_policy_arns = [ aws_iam_policy.serveless_iam_policy.arn ]

  tags = {

    Terraform = true
  }
}
