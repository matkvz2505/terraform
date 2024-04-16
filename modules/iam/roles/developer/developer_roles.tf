data "aws_iam_policy_document" "developer_policy_assume_role" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com", "cloud9.amazonaws.com", "lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "developer_iam_policy" {
  name = "${local.name}-${var.developer_path}-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AmazonS3FullAccess"
        Action = [
          "s3:*",
          "s3-object-lambda:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Sid = "AmazonAPIGatewayAdministrator"
        Action = [
          "apigateway:*"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:apigateway:*::/*"
      },
      {
        Sid = "AWSCloud9Administrator1"
        Action = [
          "cloud9:*",
          "iam:GetUser",
          "iam:ListUsers",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeInstanceTypeOfferings",
          "ec2:DescribeRouteTables"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Sid = "AWSCloud9Administrator2"
        Action = [
          "iam:CreateServiceLinkedRole"
        ]
        Effect   = "Allow"
        Resource = "*"
        Condition = {
          StringLike = {
            "iam:AWSServiceName" = "cloud9.amazonaws.com"
          }
        }
      },
      {
        Sid = "AWSCloud9Administrator3"
        Action = [
          "ssm:StartSession",
          "ssm:GetConnectionStatus"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*:*:instance/*"
        Condition = {
          StringLike = {
            "ssm:resourceTag/aws:cloud9:environment" = "*"
          }
          StringEquals = {
            "aws:CalledViaFirst" = "cloud9.amazonaws.com"
          }
        }
      },
      {
        Sid = "AWSCloud9Administrator4"
        Action = [
          "ssm:StartSession",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ssm:*:*:document/*"
      },
      {
        Sid = "AWSLambdaFullAccess1"
        Action = [
          "cloudformation:DescribeStacks",
          "cloudformation:ListStackResources",
          "cloudwatch:ListMetrics",
          "cloudwatch:GetMetricData",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "kms:ListAliases",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:ListRoles",
          "lambda:*",
          "logs:DescribeLogGroups",
          "states:DescribeStateMachine",
          "states:ListStateMachines",
          "tag:GetResources",
          "xray:GetTraceSummaries",
          "xray:BatchGetTraces"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Sid = "AWSLambdaFullAccess2"
        Action = [
          "iam:PassRole",
        ]
        Effect   = "Allow"
        Resource = "*"
        Condition = {
          StringEquals = {
            "iam:PassedToService" = "lambda.amazonaws.com"
          }
        }
      },
      {
        Sid = "AWSLambdaFullAccess3"
        Action = [
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:log-group:/aws/lambda/*"
      },
      {
        Sid = "iamPassRoleCodebuild"
        Action = [
          "iam:PassRole",
        ]
        Effect   = "Allow"
        Resource = [
          "*"
        ]
        # Resource = [
        #     "arn:aws:iam::${var.aws_account_id}:role/role-codebuild-${var.stage}-${var.region}",
        #     "arn:aws:iam::${var.aws_account_id}:role/role-codepipeline-${var.stage}-${var.region}"
        # ]
      },
      {
        Sid = "PowerUserAccess1"
        NotAction = [
          "iam:*",
          "organizations:*",
          "account:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Sid = "PowerUserAccess2"
        Action = [
          "iam:CreateServiceLinkedRole",
          "iam:DeleteServiceLinkedRole",
          "iam:ListRoles",
          "organizations:DescribeOrganization",
          "account:ListRegions",
          "account:GetAccountInformation"
        ]
        Effect   = "Allow"
        Resource = "*"
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "developer_iam_requested_region_policy" {
  name = "${local.name}-${var.developer_path}-requested-region"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow",
        Action    = "ec2:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "ecs:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "s3:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "cloud9:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "iam:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "lambda:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      },
      {
        Effect    = "Allow",
        Action    = "rds:*",
        Resource  = "*",
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" = "${var.region}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "developer_iam_deny_delete_policy" {
  name = "${local.name}-${var.developer_path}-deny-delete"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "DenyDeleteActions"
        Action = ["*"]
        Effect   = "Deny"
        Resource = "*"
        Condition = {
          StringEquals = {
            "aws:RequestType" = "Delete"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role" "developer_iam_role" {
  name               = "${local.name}-${var.developer_path}-role"
  path               = "/${var.developer_path}/"
  assume_role_policy = data.aws_iam_policy_document.developer_policy_assume_role.json
  managed_policy_arns = [ aws_iam_policy.developer_iam_policy.arn ]

  tags = {

    Terraform = true
  }
}

resource "aws_iam_role" "developer_iam_role_requested_region" {
  name               = "${local.name}-${var.developer_path}-requested-region"
  path               = "/${var.developer_path}/"
  assume_role_policy = data.aws_iam_policy_document.developer_policy_assume_role.json
  managed_policy_arns = [ aws_iam_policy.developer_iam_requested_region_policy.arn ]

  tags = {

    Terraform = true
  }
}

resource "aws_iam_role" "developer_iam_role_deny_delete" {
  name               = "${local.name}-${var.developer_path}-deny-delete"
  path               = "/${var.developer_path}/"
  assume_role_policy = data.aws_iam_policy_document.developer_policy_assume_role.json
  managed_policy_arns = [ aws_iam_policy.developer_iam_deny_delete_policy.arn ]

  tags = {

    Terraform = true
  }
}
