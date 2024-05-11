output "oidc_provider" {
  description = "IAM OIDC Identity Provider 정보."
  value       = module.oidc_provider
}

output "roles" {
  description = "IAM Role 정보."
  value       = module.role
}
