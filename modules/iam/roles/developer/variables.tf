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