output "admin_iam_role_instance" {
  value = aws_iam_role.admin_iam_role_instance
}

output "admin_policy_instance_arn" {
  value = aws_iam_policy.admin_iam_policy.arn
}