# iam-role

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
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_entities](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_iam_entity_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_oidc_provider_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_saml_provider_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_service_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assumable_roles"></a> [assumable\_roles](#input\_assumable\_roles) | (선택) 역할이 맡을 수 있는 IAM 역할 ARN 목록. | `list(string)` | `[]` | no |
| <a name="input_conditions"></a> [conditions](#input\_conditions) | (필수) 역할을 맡는 데 필요한 조건 목록. `conditions` 블록 내용.<br>    (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.<br>    (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.<br>    (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록. | <pre>list(object({<br>    key       = string<br>    condition = string<br>    values    = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | (선택) IAM role 설명. | `string` | `"Managed by Terraform."` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | (선택) 역할을 삭제하기 전에 해당 역할의 모든 정책을 강제로 분리. Default: `false`. | `bool` | `false` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | (선택) IAM 역할에 연결할 인라인 IAM 정책 맵. | `map(string)` | `{}` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | (선택) 인스턴스 프로필에 대한 구성. `instance_profile` 블록 내용.<br>    (선택) `enabled` - 인스턴스 프로파일 생성 여부. Default: `false`.<br>    (선택) `name` - 인스턴스 프로필의 이름 생략시 역할이름으로 대체.<br>    (선택) `path` - 인스턴스 프로필 경로. Default: `/`.<br>    (선택) `tags` - 인스턴스 프로필에 추가할 태그 맵. | <pre>object({<br>    enabled = optional(bool, false)<br>    name    = optional(string)<br>    path    = optional(string, "/")<br>    tags    = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | (선택) 지정된 역할에 대해 설정하려는 최대 세션 기간(초). 유효한 값 1시간(`3600`) 부터 12시간(`43200`). Default: `3600`. | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) IAM role 이름. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | (선택) IAM role path Default: `/`. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | (선택) 역할에 대한 권한 경계를 설정하는 데 사용되는 정책의 ARN. | `string` | `null` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | (선택) IAM 역할에 연결할 IAM 정책 ARN 목록. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |
| <a name="input_trusted_iam_entity_policies"></a> [trusted\_iam\_entity\_policies](#input\_trusted\_iam\_entity\_policies) | (선택) 신뢰할 수 있는 iam 엔터티 정책에 대한 구성. `trusted_iam_entity_policies` 블록 내용.<br>    (필수) `iam_entities` - 역할을 맡을 수 있는 AWS IAM 엔터티의 ARN 목록.<br>    (선택) `conditions` - IAM 엔터티를 통해 역할을 맡는 데 필요한 조건 목록.<br>      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.<br>      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.<br>      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.<br>    (선택) `mfa` - MFA 요구 사항의 구성.<br>      (선택) `required` - MFA가 역할을 맡도록 요구할지 여부. Default: `false`.<br>      (선택) `ttl` - MFA가 필요한 역할에 대한 유효한 MFA 기간(초). Default: `86400` (24 hours).<br>    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.<br>    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.<br>    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.<br>    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록. | <pre>list(object({<br>    iam_entities = list(string)<br>    conditions = optional(list(object({<br>      key       = string<br>      condition = string<br>      values    = list(string)<br>    })), [])<br>    mfa = optional(object({<br>      required = optional(bool, false)<br>      ttl      = optional(number, 24 * 60 * 60)<br>    }), {})<br>    effective_date      = optional(string)<br>    expiration_date     = optional(string)<br>    source_ip_whitelist = optional(list(string), [])<br>    source_ip_blacklist = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_trusted_oidc_provider_policies"></a> [trusted\_oidc\_provider\_policies](#input\_trusted\_oidc\_provider\_policies) | (선택) 신뢰할 수 있는 OIDC ID 공급자 정책 구성. `trusted_oidc_provider_policies` 블록 내용.<br>    (필수) `url` - OIDC ID 공급자의 URL. Provider가 공통이 아닌 경우 해당 IAM OIDC Provider를 먼저 생성. 지원되는 일반 OIDC 공급자는 `accounts.google.com`, `cognito-identity.amazonaws.com`, `graph.facebook.com`, `www.amazon.com`.<br>    (선택) `conditions` - OIDC 공급자를 통해 역할을 맡는 데 필요한 조건 목록.<br>      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.<br>      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.<br>      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.<br>    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.<br>    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.<br>    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.<br>    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록. | <pre>list(object({<br>    url = string<br>    conditions = optional(list(object({<br>      key       = string<br>      condition = string<br>      values    = list(string)<br>    })), [])<br>    effective_date      = optional(string)<br>    expiration_date     = optional(string)<br>    source_ip_whitelist = optional(list(string), [])<br>    source_ip_blacklist = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_trusted_saml_provider_policies"></a> [trusted\_saml\_provider\_policies](#input\_trusted\_saml\_provider\_policies) | (선택) 신뢰할 수 있는 SAML ID 공급자 정책 구성. `trusted_saml_provider_policies` 블록 내용.<br>    (필수) `name` - SAML ID 공급자의 이름.<br>    (선택) `conditions` - SAML 공급자를 통해 역할을 맡는 데 필요한 조건 목록.<br>      (필수) `key` - 정책이 적용될 때 조건과 일치하는 SAML 키.<br>      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.<br>      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.<br>    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.<br>    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.<br>    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.<br>    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록. | <pre>list(object({<br>    name = string<br>    conditions = optional(list(object({<br>      key       = string<br>      condition = string<br>      values    = list(string)<br>    })), [])<br>    effective_date      = optional(string)<br>    expiration_date     = optional(string)<br>    source_ip_whitelist = optional(list(string), [])<br>    source_ip_blacklist = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_trusted_service_policies"></a> [trusted\_service\_policies](#input\_trusted\_service\_policies) | (선택) 신뢰할 수 있는 서비스 정책을 위한 구성. `trusted_service_policies` 블록 내용.<br>    (필수) `services` - 역할을 맡을 수 있는 AWS 서비스 목록.<br>    (선택) `conditions` - AWS 서비스를 통해 역할을 맡는 데 필요한 조건 목록.<br>      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.<br>      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.<br>      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.<br>    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.<br>    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.<br>    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.<br>    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록. | <pre>list(object({<br>    services = list(string)<br>    conditions = optional(list(object({<br>      key       = string<br>      condition = string<br>      values    = list(string)<br>    })), [])<br>    effective_date      = optional(string)<br>    expiration_date     = optional(string)<br>    source_ip_whitelist = optional(list(string), [])<br>    source_ip_blacklist = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| <a name="input_trusted_session_tagging"></a> [trusted\_session\_tagging](#input\_trusted\_session\_tagging) | (선택) AWS STS의 세션 태그 구성 `trusted_session_tagging` 블록 내용.<br>    (선택) `enabled` - 세션 태그 지정을 활성화할지 여부. Default: `true`.<br>    (선택) `allowed_tags` - 세션 태그로 사용할 수 있는 태그 키와 값을 제한하기 위한 태그 키/값 쌍의 맵.<br>    (선택) `allowed_transitive_tag_keys` - 태그의 최대 집합을 제한하는 태그 키 집합. | <pre>object({<br>    enabled                     = optional(bool, true)<br>    allowed_tags                = optional(map(set(string)), {})<br>    allowed_transitive_tag_keys = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_trusted_source_identity"></a> [trusted\_source\_identity](#input\_trusted\_source\_identity) | (선택) AWS STS의 소스 ID 구성. `trusted_source_identity` 블록내용.<br>    (선택) `enabled` - 소스 ID 구성을 활성화할지 여부. Default: `true`.<br>    (선택) `allowed_identities` - 최대 소스 ID 세트를 제한하는 ID 세트. | <pre>object({<br>    enabled            = optional(bool, true)<br>    allowed_identities = optional(set(string), [])<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | IAM Role ARN. |
| <a name="output_assumable_roles"></a> [assumable\_roles](#output\_assumable\_roles) | IAM Role이 맡을 수 있는 IAM 역할의 ARN 목록. |
| <a name="output_description"></a> [description](#output\_description) | IAM Role 설명. |
| <a name="output_inline_policies"></a> [inline\_policies](#output\_inline\_policies) | IAM Role에 연결된 인라인 IAM 정책 이름 목록. |
| <a name="output_instance_profile"></a> [instance\_profile](#output\_instance\_profile) | IAM 역할과 연결된 인스턴스 프로파일.<br>    `id` - instance profile ID.<br>    `arn` - instance profile ARN.<br>    `name` - instance profile 이름.<br>    `path` - instance profile 경로. |
| <a name="output_name"></a> [name](#output\_name) | IAM Role 이름. |
| <a name="output_policies"></a> [policies](#output\_policies) | IAM Role에 연결된 IAM 정책의 ARN 목록. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | IAM Role unique ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
