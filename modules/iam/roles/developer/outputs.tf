output "developer_policy_arn" {
  value = aws_iam_policy.developer_iam_policy.arn
}

output "developer_iam_requested_region_policy_arn" {
  value = aws_iam_policy.developer_iam_requested_region_policy.arn
}

output "developer_iam_deny_delete_policy_arn" {
  value = aws_iam_policy.developer_iam_deny_delete_policy.arn
}