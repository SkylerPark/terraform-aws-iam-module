output "id" {
  description = "provider ID."
  value       = aws_iam_openid_connect_provider.this.id
}

output "arn" {
  description = "provider ARN."
  value       = aws_iam_openid_connect_provider.this.arn
}

output "url" {
  description = "identity provider URL."
  value       = var.url
}

output "urn" {
  description = "identity provider URN."
  value       = aws_iam_openid_connect_provider.this.url
}

output "audiences" {
  description = "IAM OIDC provider 대상 목록."
  value       = aws_iam_openid_connect_provider.this.client_id_list
}

output "thumbprints" {
  description = "OIDC 공급자의 서버 인증서의 대한 목록."
  value       = aws_iam_openid_connect_provider.this.thumbprint_list
}
