# account

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
| [aws_iam_account_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (필수) AWS Account alias 이름. | `string` | n/a | yes |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | (선택) AWS Account Password 정책. Default: `CIS 1.4.0` | <pre>object({<br>    minimum_password_length        = optional(number, 14)<br>    require_numbers                = optional(bool, true)<br>    require_symbols                = optional(bool, true)<br>    require_lowercase_characters   = optional(bool, true)<br>    require_uppercase_characters   = optional(bool, true)<br>    allow_users_to_change_password = optional(bool, true)<br>    hard_expiry                    = optional(bool, false)<br>    max_password_age               = optional(number, 90)<br>    password_reuse_prevention      = optional(number, 24)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | AWS Account ID. |
| <a name="output_name"></a> [name](#output\_name) | AWS account account alias 이름. |
| <a name="output_password_policy"></a> [password\_policy](#output\_password\_policy) | AWS account Password 정책. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
