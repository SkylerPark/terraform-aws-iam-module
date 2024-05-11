# iam-user

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_service_specific_credential.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_specific_credential) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_ssh_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_ssh_key) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_keys"></a> [access\_keys](#input\_access\_keys) | (선택) IAM 사용자와 연결할 액세스 키 목록. `access_keys` 블록 내용.<br>    (필수) `enabled` - 액세스 키 활성화 여부. | `list(map(bool))` | `[]` | no |
| <a name="input_assumable_roles"></a> [assumable\_roles](#input\_assumable\_roles) | (선택) List of IAM roles ARNs which can be assumed by the user. | `list(string)` | `[]` | no |
| <a name="input_console_access"></a> [console\_access](#input\_console\_access) | (선택) 사용자의 AWS 콘솔 액세스 및 비밀번호 구성. `console_access` 블록 내용.<br>    (선택) `enabled` - AWS 콘솔 액세스 및 비밀번호 활성화 여부.<br>    (선택) `password_length` - 생성된 비밀번호의 길이. Default: `20`.<br>    (선택) `password_reset_required` -  사용자가 처음 로그인할 때 생성된 비밀번호를 강제로 재설정해야 하는지 여부. Default: `true`. | `any` | `{}` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (선택) 사용자를 삭제시 Terraform에서 관리하지 않는 IAM 액세스 키, 로그인 프로필 또는 MFA 디바이스가 있더라도 삭제. | `bool` | `false` | no |
| <a name="input_groups"></a> [groups](#input\_groups) | (선택) 사용자를 추가할 IAM 그룹 목록. | `list(string)` | `[]` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | (선택) IAM 사용자에 연결할 인라인 IAM 정책 맵. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) IAM user 이름. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | (선택) IAM user 경로 Default: `/` | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | (선택) 사용자에 대한 권한 경계를 설정하는 데 사용되는 정책의 ARN. | `string` | `null` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | (선택) Base-64로 인코딩된 PGP 공개 키 또는 keybase:username 형식의 키베이스 사용자 이름 비밀번호 및 액세스 키를 암호화하는 데 사용. | `string` | `""` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | (선택) 사용자가 맡을 수 있는 IAM 역할 ARN 목록. | `list(string)` | `[]` | no |
| <a name="input_service_credentials"></a> [service\_credentials](#input\_service\_credentials) | (선택) IAM 사용자와 연결할 서비스별 자격 증명 목록. `service_credentials` 블록 내용.<br>    (필수) `service` - 자격 증명과 연결될 AWS 서비스의 이름.<br>    (선택) `enabled` - 서비스별 자격 증명을 활성화할지 여부. | `any` | `[]` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | (선택) IAM 사용자와 연결할 SSH 공개 키 목록. `ssh_keys` 블록 내용.<br>    (필수) `public_key` - SSH 공개 키입니다. 공개 키는 ssh-rsa 형식 또는 PEM 형식으로 인코딩.<br>    (선택) `encoding` - 공개 키 인코딩 형식을 지정. 유효한 값 'SSH', 'PEM'. ssh-rsa 형식의 공개 키를 검색하려면 'SSH'를 사용. PEM 형식의 공개 키를 검색하려면 'PEM'을 사용.<br>    (선택) `enabled` - SSH 공개 키 활성화 여부. | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_keys"></a> [access\_keys](#output\_access\_keys) | 사용자의 IAM 액세스 키 목록. |
| <a name="output_arn"></a> [arn](#output\_arn) | IAM User ARN. |
| <a name="output_assumable_roles"></a> [assumable\_roles](#output\_assumable\_roles) | IAM User가 맡을 수 있는 IAM 역할의 ARN 목록. |
| <a name="output_console_access"></a> [console\_access](#output\_console\_access) | 사용자의 AWS 콘솔 액세스 정보 및 비밀번호. |
| <a name="output_groups"></a> [groups](#output\_groups) | IAM 그룹 목록. |
| <a name="output_inline_policies"></a> [inline\_policies](#output\_inline\_policies) | IAM User에 연결된 인라인 IAM 정책 이름 목록. |
| <a name="output_name"></a> [name](#output\_name) | IAM User 이름. |
| <a name="output_pgp_key"></a> [pgp\_key](#output\_pgp\_key) | 이 사용자의 중요한 데이터를 암호화하는 데 사용되는 PGP 키. |
| <a name="output_policies"></a> [policies](#output\_policies) | IAM User에게 연결된 IAM 정책의 ARN 목록. |
| <a name="output_service_credentials"></a> [service\_credentials](#output\_service\_credentials) | 사용자의 서비스별 자격 증명 목록. |
| <a name="output_ssh_keys"></a> [ssh\_keys](#output\_ssh\_keys) | 사용자의 SSH 공개 키 목록. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | IAM User unique ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
