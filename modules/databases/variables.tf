variable "stage" {
  type        = string
}

variable "project" {
  type        = string
}

variable "aws_account_id" {
  type = string
}

variable "region" {
  type = string
}

variable "master_password" {
  type = string
}

variable "master_username" {
  type = string
}

# variable "private_subnet_ids" {
#   type = list(string)
# }

# variable "public_subnet_ids" {
#   type = list(string)
# }

variable "database_subnets_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = list(string)
}

variable "security_group_name" {
  type = list(string)
}

variable "database_subnet_group_name" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}