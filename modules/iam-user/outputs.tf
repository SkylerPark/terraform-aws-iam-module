output "name" {
  description = "IAM User 이름."
  value       = aws_iam_user.this.name
}

output "arn" {
  description = "IAM User ARN."
  value       = aws_iam_user.this.arn
}

output "unique_id" {
  description = "IAM User unique ID."
  value       = aws_iam_user.this.unique_id
}

output "groups" {
  description = "IAM 그룹 목록."
  value       = aws_iam_user_group_membership.this.groups
}

output "pgp_key" {
  description = "이 사용자의 중요한 데이터를 암호화하는 데 사용되는 PGP 키."
  value       = var.pgp_key
}

# NOTE: terraform output encrypted_password | base64 --decode | keybase pgp decrypt
output "console_access" {
  description = "사용자의 AWS 콘솔 액세스 정보 및 비밀번호."
  value = {
    enabled            = try(var.console_access.enabled, true)
    encrypted_password = one(aws_iam_user_login_profile.this[*].encrypted_password)
  }
}

# NOTE: terraform output encrypted_secret_access_key | base64 --decode | keybase pgp decrypt
output "access_keys" {
  description = "사용자의 IAM 액세스 키 목록."
  value = [
    for access_key in aws_iam_access_key.this : {
      id                          = access_key.id
      encrypted_secret_access_key = access_key.encrypted_secret
      encrypted_ses_smtp_password = access_key.encrypted_ses_smtp_password_v4
      created_at                  = access_key.create_date
      enabled                     = access_key.status == "Active"
    }
  ]
}

output "ssh_keys" {
  description = "사용자의 SSH 공개 키 목록."
  value = [
    for ssh_key in aws_iam_user_ssh_key.this : {
      id = ssh_key.ssh_public_key_id

      encoding    = ssh_key.encoding
      public_key  = ssh_key.public_key
      fingerprint = ssh_key.fingerprint
      enabled     = ssh_key.status == "Active"
    }
  ]
}

output "service_credentials" {
  description = "사용자의 서비스별 자격 증명 목록."
  value = {
    for service, credential in aws_iam_service_specific_credential.this :
    service => {
      id       = credential.service_specific_credential_id
      username = credential.service_user_name
      password = credential.service_password
      enabled  = credential.status == "Active"
    }
  }
}

output "assumable_roles" {
  description = "IAM User가 맡을 수 있는 IAM 역할의 ARN 목록."
  value       = var.assumable_roles
}

output "policies" {
  description = "IAM User에게 연결된 IAM 정책의 ARN 목록."
  value       = var.policies
}

output "inline_policies" {
  description = "IAM User에 연결된 인라인 IAM 정책 이름 목록."
  value       = keys(var.inline_policies)
}
