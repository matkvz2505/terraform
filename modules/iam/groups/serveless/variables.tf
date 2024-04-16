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

variable "serveless_path" {
  type      = string
}

variable "serveless_policy_instance_arn" {
  type      = string
}