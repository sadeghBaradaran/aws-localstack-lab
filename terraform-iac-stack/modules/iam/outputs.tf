output "user_name" {
  description = "Name of the IAM user."
  value       = aws_iam_user.this.name
}

output "role_arn" {
  description = "ARN of the IAM role."
  value       = aws_iam_role.this.arn
}

output "policy_arn" {
  description = "ARN of the IAM policy."
  value       = aws_iam_policy.s3_access.arn
}
