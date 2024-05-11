variable "name" {
  description = "(필수) IAM role 이름."
  type        = string
  nullable    = false
}

variable "path" {
  description = "(선택) IAM role path Default: `/`."
  type        = string
  default     = "/"
  nullable    = false
}

variable "description" {
  description = "(선택) IAM role 설명."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}

variable "max_session_duration" {
  description = "(선택) 지정된 역할에 대해 설정하려는 최대 세션 기간(초). 유효한 값 1시간(`3600`) 부터 12시간(`43200`). Default: `3600`."
  type        = number
  default     = 3600
  nullable    = false
  validation {
    condition = alltrue([
      var.max_session_duration >= 3600,
      var.max_session_duration <= 43200
    ])
    error_message = "유효한 값은 1시간(`3600`) 부터 12시간(`43200`) 입니다."
  }
}

variable "force_detach_policies" {
  description = "(선택) 역할을 삭제하기 전에 해당 역할의 모든 정책을 강제로 분리. Default: `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "permissions_boundary" {
  description = "(선택) 역할에 대한 권한 경계를 설정하는 데 사용되는 정책의 ARN."
  type        = string
  default     = null
  nullable    = true
}


variable "trusted_session_tagging" {
  description = <<EOF
  (선택) AWS STS의 세션 태그 구성 `trusted_session_tagging` 블록 내용.
    (선택) `enabled` - 세션 태그 지정을 활성화할지 여부. Default: `true`.
    (선택) `allowed_tags` - 세션 태그로 사용할 수 있는 태그 키와 값을 제한하기 위한 태그 키/값 쌍의 맵.
    (선택) `allowed_transitive_tag_keys` - 태그의 최대 집합을 제한하는 태그 키 집합.
  EOF
  type = object({
    enabled                     = optional(bool, true)
    allowed_tags                = optional(map(set(string)), {})
    allowed_transitive_tag_keys = optional(set(string), [])
  })
  default  = {}
  nullable = false
}

variable "trusted_source_identity" {
  description = <<EOF
  (선택) AWS STS의 소스 ID 구성. `trusted_source_identity` 블록내용.
    (선택) `enabled` - 소스 ID 구성을 활성화할지 여부. Default: `true`.
    (선택) `allowed_identities` - 최대 소스 ID 세트를 제한하는 ID 세트.
  EOF
  type = object({
    enabled            = optional(bool, true)
    allowed_identities = optional(set(string), [])
  })
  default  = {}
  nullable = false
}

variable "trusted_iam_entity_policies" {
  description = <<EOF
  (선택) 신뢰할 수 있는 iam 엔터티 정책에 대한 구성. `trusted_iam_entity_policies` 블록 내용.
    (필수) `iam_entities` - 역할을 맡을 수 있는 AWS IAM 엔터티의 ARN 목록.
    (선택) `conditions` - IAM 엔터티를 통해 역할을 맡는 데 필요한 조건 목록.
      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.
      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.
      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.
    (선택) `mfa` - MFA 요구 사항의 구성.
      (선택) `required` - MFA가 역할을 맡도록 요구할지 여부. Default: `false`.
      (선택) `ttl` - MFA가 필요한 역할에 대한 유효한 MFA 기간(초). Default: `86400` (24 hours).
    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.
    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.
    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.
    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록.
  EOF

  type = list(object({
    iam_entities = list(string)
    conditions = optional(list(object({
      key       = string
      condition = string
      values    = list(string)
    })), [])
    mfa = optional(object({
      required = optional(bool, false)
      ttl      = optional(number, 24 * 60 * 60)
    }), {})
    effective_date      = optional(string)
    expiration_date     = optional(string)
    source_ip_whitelist = optional(list(string), [])
    source_ip_blacklist = optional(list(string), [])
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for policy in var.trusted_iam_entity_policies :
      can(formatdate("", policy.effective_date))
      if policy.effective_date != null
    ])
    error_message = "`effective_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
  validation {
    condition = alltrue([
      for policy in var.trusted_iam_entity_policies :
      can(formatdate("", policy.expiration_date))
      if policy.expiration_date != null
    ])
    error_message = "`expiration_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
}

variable "trusted_service_policies" {
  description = <<EOF
  (선택) 신뢰할 수 있는 서비스 정책을 위한 구성. `trusted_service_policies` 블록 내용.
    (필수) `services` - 역할을 맡을 수 있는 AWS 서비스 목록.
    (선택) `conditions` - AWS 서비스를 통해 역할을 맡는 데 필요한 조건 목록.
      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.
      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.
      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.
    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.
    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.
    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.
    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록.
  EOF

  type = list(object({
    services = list(string)
    conditions = optional(list(object({
      key       = string
      condition = string
      values    = list(string)
    })), [])
    effective_date      = optional(string)
    expiration_date     = optional(string)
    source_ip_whitelist = optional(list(string), [])
    source_ip_blacklist = optional(list(string), [])
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for policy in var.trusted_service_policies :
      can(formatdate("", policy.effective_date))
      if policy.effective_date != null
    ])
    error_message = "`effective_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
  validation {
    condition = alltrue([
      for policy in var.trusted_service_policies :
      can(formatdate("", policy.expiration_date))
      if policy.expiration_date != null
    ])
    error_message = "`expiration_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
}

variable "trusted_oidc_provider_policies" {
  description = <<EOF
  (선택) 신뢰할 수 있는 OIDC ID 공급자 정책 구성. `trusted_oidc_provider_policies` 블록 내용.
    (필수) `url` - OIDC ID 공급자의 URL. Provider가 공통이 아닌 경우 해당 IAM OIDC Provider를 먼저 생성. 지원되는 일반 OIDC 공급자는 `accounts.google.com`, `cognito-identity.amazonaws.com`, `graph.facebook.com`, `www.amazon.com`.
    (선택) `conditions` - OIDC 공급자를 통해 역할을 맡는 데 필요한 조건 목록.
      (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.
      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.
      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.
    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.
    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.
    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.
    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록.
  EOF

  type = list(object({
    url = string
    conditions = optional(list(object({
      key       = string
      condition = string
      values    = list(string)
    })), [])
    effective_date      = optional(string)
    expiration_date     = optional(string)
    source_ip_whitelist = optional(list(string), [])
    source_ip_blacklist = optional(list(string), [])
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for policy in var.trusted_oidc_provider_policies :
      can(formatdate("", policy.effective_date))
      if policy.effective_date != null
    ])
    error_message = "`effective_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
  validation {
    condition = alltrue([
      for policy in var.trusted_oidc_provider_policies :
      can(formatdate("", policy.expiration_date))
      if policy.expiration_date != null
    ])
    error_message = "`expiration_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
}

variable "trusted_saml_provider_policies" {
  description = <<EOF
  (선택) 신뢰할 수 있는 SAML ID 공급자 정책 구성. `trusted_saml_provider_policies` 블록 내용.
    (필수) `name` - SAML ID 공급자의 이름.
    (선택) `conditions` - SAML 공급자를 통해 역할을 맡는 데 필요한 조건 목록.
      (필수) `key` - 정책이 적용될 때 조건과 일치하는 SAML 키.
      (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.
      (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.
    (선택) `effective_date` - 특정 날짜 및 시간 이후에만 IAM 역할을 맡도록 허용.
    (선택) `expiration_date` - 특정 날짜 및 시간 이전에만 IAM 역할을 맡도록 허용.
    (선택) `source_ip_whitelist` - IAM 역할을 맡을 수 있는 소스 IP 주소 또는 CIDR 목록.
    (선택) `source_ip_blacklist` - IAM 역할을 맡는 것이 허용되지 않는 소스 IP 주소 또는 CIDR 목록.
  EOF

  type = list(object({
    name = string
    conditions = optional(list(object({
      key       = string
      condition = string
      values    = list(string)
    })), [])
    effective_date      = optional(string)
    expiration_date     = optional(string)
    source_ip_whitelist = optional(list(string), [])
    source_ip_blacklist = optional(list(string), [])
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for policy in var.trusted_saml_provider_policies :
      can(formatdate("", policy.effective_date))
      if policy.effective_date != null
    ])
    error_message = "`effective_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
  validation {
    condition = alltrue([
      for policy in var.trusted_saml_provider_policies :
      can(formatdate("", policy.expiration_date))
      if policy.expiration_date != null
    ])
    error_message = "`expiration_date` 유효한 RFC 3339 타임스탬프여야 합니다."
  }
}

variable "conditions" {
  description = <<EOF
  (필수) 역할을 맡는 데 필요한 조건 목록. `conditions` 블록 내용.
    (필수) `key` - 정책이 적용될 때 조건을 일치시키는 키.
    (필수) `condition` - 정책의 조건 키 및 값을 요청 컨텍스트의 키 및 값과 일치시키는 조건 연산자. 예: `StringEquals`, `StringLike`.
    (필수) `values` - 조건 연산자와 조건을 일치시키기 위해 허용되는 키 값 목록.
  EOF
  type = list(object({
    key       = string
    condition = string
    values    = list(string)
  }))
  default  = []
  nullable = false
}


variable "assumable_roles" {
  description = "(선택) 역할이 맡을 수 있는 IAM 역할 ARN 목록."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "policies" {
  description = "(선택) IAM 역할에 연결할 IAM 정책 ARN 목록."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "inline_policies" {
  description = "(선택) IAM 역할에 연결할 인라인 IAM 정책 맵."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "instance_profile" {
  description = <<EOF
  (선택) 인스턴스 프로필에 대한 구성. `instance_profile` 블록 내용.
    (선택) `enabled` - 인스턴스 프로파일 생성 여부. Default: `false`.
    (선택) `name` - 인스턴스 프로필의 이름 생략시 역할이름으로 대체.
    (선택) `path` - 인스턴스 프로필 경로. Default: `/`.
    (선택) `tags` - 인스턴스 프로필에 추가할 태그 맵.
  EOF
  type = object({
    enabled = optional(bool, false)
    name    = optional(string)
    path    = optional(string, "/")
    tags    = optional(map(string), {})
  })
  default  = {}
  nullable = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}
