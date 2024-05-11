# iam-oidc-identity-provider

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.10 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audiences"></a> [audiences](#input\_audiences) | (선택) IAM OIDC 공급자의 대상 목록. Default: `sts.amazonaws.com` | `set(string)` | <pre>[<br>  "sts.amazonaws.com"<br>]</pre> | no |
| <a name="input_auto_thumbprint_enabled"></a> [auto\_thumbprint\_enabled](#input\_auto\_thumbprint\_enabled) | (선택) 서버 인증서의 지문을 자동 설정 할지 여부 Default: `true`. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |
| <a name="input_thumbprints"></a> [thumbprints](#input\_thumbprints) | (선택) OIDC 공급자의 서버 인증서의 대한 목록. | `list(string)` | `[]` | no |
| <a name="input_url"></a> [url](#input\_url) | (필수) 인증 요청을 위한 보안 OpenID Connect URL. 최대 255자로 URL 은 `https://` 로 시작. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | provider ARN. |
| <a name="output_audiences"></a> [audiences](#output\_audiences) | IAM OIDC provider 대상 목록. |
| <a name="output_id"></a> [id](#output\_id) | provider ID. |
| <a name="output_thumbprints"></a> [thumbprints](#output\_thumbprints) | OIDC 공급자의 서버 인증서의 대한 목록. |
| <a name="output_url"></a> [url](#output\_url) | identity provider URL. |
| <a name="output_urn"></a> [urn](#output\_urn) | identity provider URN. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
