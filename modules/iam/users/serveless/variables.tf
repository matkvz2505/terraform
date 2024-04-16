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

variable "group_serveless_name" {
  type      = string
}
