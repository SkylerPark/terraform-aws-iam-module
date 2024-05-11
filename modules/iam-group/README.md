# iam-group

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
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy.inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy_attachment.managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assumable_roles"></a> [assumable\_roles](#input\_assumable\_roles) | (선택) 그룹이 맡을수 있는 IAM 역할 목록. | `list(string)` | `[]` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | (선택) IAM 그룹에 연결할 인라인 IAM 정책 맵. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) IAM group 이름. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | (선택) IAM group path Default: `/`. | `string` | `"/"` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | (선택) 그룹에 연결할 IAM 정책 ARN 목록. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | IAM group ARN. |
| <a name="output_assumable_roles"></a> [assumable\_roles](#output\_assumable\_roles) | IAM 그룹의 구성원이 맡을 수 있는 IAM 역할의 ARN 목록. |
| <a name="output_inline_policies"></a> [inline\_policies](#output\_inline\_policies) | IAM 그룹에 연결된 인라인 IAM 정책 이름 목록. |
| <a name="output_name"></a> [name](#output\_name) | IAM group 이름. |
| <a name="output_policies"></a> [policies](#output\_policies) | IAM 그룹에 연결된 IAM 정책의 ARN 목록. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | IAM group unique ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
