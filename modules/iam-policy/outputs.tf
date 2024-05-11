output "id" {
  description = "IAM policy ID."
  value       = aws_iam_policy.this.policy_id
}

output "arn" {
  description = "IAM policy ARN."
  value       = aws_iam_policy.this.arn
}

output "name" {
  description = "IAM policy 이름."
  value       = aws_iam_policy.this.name
}

output "path" {
  description = "IAM policy path."
  value       = aws_iam_policy.this.path
}

output "description" {
  description = "IAM policy 설명."
  value       = aws_iam_policy.this.description
}
