# iam-policy

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
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (선택) IAM policy 설명. | `string` | `"Managed by Terraform."` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) IAM policy 이름. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | (선택) IAM policy path Default: `/`.. | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (필수) JSON 형식의 정책 문서. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | IAM policy ARN. |
| <a name="output_description"></a> [description](#output\_description) | IAM policy 설명. |
| <a name="output_id"></a> [id](#output\_id) | IAM policy ID. |
| <a name="output_name"></a> [name](#output\_name) | IAM policy 이름. |
| <a name="output_path"></a> [path](#output\_path) | IAM policy path. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
