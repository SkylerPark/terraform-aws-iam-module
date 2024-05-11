output "name" {
  description = "IAM Role 이름."
  value       = aws_iam_role.this.name
}

output "arn" {
  description = "IAM Role ARN."
  value       = aws_iam_role.this.arn
}

output "unique_id" {
  description = "IAM Role unique ID."
  value       = aws_iam_role.this.unique_id
}

output "description" {
  description = "IAM Role 설명."
  value       = aws_iam_role.this.description
}

output "assumable_roles" {
  description = "IAM Role이 맡을 수 있는 IAM 역할의 ARN 목록."
  value       = var.assumable_roles
}

output "policies" {
  description = "IAM Role에 연결된 IAM 정책의 ARN 목록."
  value       = var.policies
}

output "inline_policies" {
  description = "IAM Role에 연결된 인라인 IAM 정책 이름 목록."
  value       = keys(var.inline_policies)
}

output "instance_profile" {
  description = <<EOF
  IAM 역할과 연결된 인스턴스 프로파일.
    `id` - instance profile ID.
    `arn` - instance profile ARN.
    `name` - instance profile 이름.
    `path` - instance profile 경로.
  EOF
  value = (var.instance_profile.enabled
    ? {
      id   = aws_iam_instance_profile.this[0].unique_id
      arn  = aws_iam_instance_profile.this[0].arn
      name = aws_iam_instance_profile.this[0].name
      path = aws_iam_instance_profile.this[0].path
    }
    : null
  )
}
