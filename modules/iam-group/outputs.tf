output "name" {
  description = "IAM group 이름."
  value       = aws_iam_group.this.name
}

output "arn" {
  description = "IAM group ARN."
  value       = aws_iam_group.this.arn
}

output "unique_id" {
  description = "IAM group unique ID."
  value       = aws_iam_group.this.unique_id
}

output "assumable_roles" {
  description = "IAM 그룹의 구성원이 맡을 수 있는 IAM 역할의 ARN 목록."
  value       = var.assumable_roles
}

output "policies" {
  description = "IAM 그룹에 연결된 IAM 정책의 ARN 목록."
  value       = var.policies
}

output "inline_policies" {
  description = "IAM 그룹에 연결된 인라인 IAM 정책 이름 목록."
  value       = keys(var.inline_policies)
}
