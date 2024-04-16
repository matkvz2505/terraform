variable "stage" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type      = string
  sensitive = true
}

variable "aws_account_id" {
  type      = string
  sensitive = true
}

variable "developer_path" {
  type      = string
}

variable "developer_policy_arn" {
  type      = string
}

variable "developer_iam_requested_region_policy_arn" {
  type      = string
}

variable "developer_iam_deny_delete_policy_arn" {
  type      = string
}
