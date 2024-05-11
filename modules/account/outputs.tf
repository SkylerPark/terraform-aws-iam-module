output "id" {
  description = "AWS Account ID."
  value       = data.aws_caller_identity.this.account_id
}

output "name" {
  description = "AWS account account alias 이름."
  value       = aws_iam_account_alias.this.account_alias
}

output "password_policy" {
  description = "AWS account Password 정책."
  value       = aws_iam_account_password_policy.this
}
