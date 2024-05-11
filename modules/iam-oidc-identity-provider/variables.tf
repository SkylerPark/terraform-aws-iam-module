variable "url" {
  description = "(필수) 인증 요청을 위한 보안 OpenID Connect URL. 최대 255자로 URL 은 `https://` 로 시작."
  type        = string

  validation {
    condition     = startswith(var.url, "https://")
    error_message = "`url` 은 `https://` 로 시작 해야합니다."
  }
}

variable "audiences" {
  description = "(선택) IAM OIDC 공급자의 대상 목록. Default: `sts.amazonaws.com`"
  type        = set(string)
  default     = ["sts.amazonaws.com"]
  nullable    = false
}

variable "thumbprints" {
  description = "(선택) OIDC 공급자의 서버 인증서의 대한 목록."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "auto_thumbprint_enabled" {
  description = "(선택) 서버 인증서의 지문을 자동 설정 할지 여부 Default: `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}
