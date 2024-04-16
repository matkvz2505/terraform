variable "stage" {
  description = "Name of the current enviroment"
  type        = string
}

variable "project" {
  description = "Name of the infraestructure project"
  type        = string
}

variable "region" {
  description = "Cloud Region for the resources deployed"
  type        = string
}

variable "aws_account_id" {
  description = "Account ID of The Project"
  type        = string
}

variable "dns_zone" {
  type = string
}

variable "AWS_ACCESS_KEY" {
  description = "Account Key for Terraform AWS Access"
  type        = string
}

variable "AWS_SECRET_KEY" {
  description = "Account Key for Terraform AWS Access"
  type        = string
}
