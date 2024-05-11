variable "name" {
  description = "(필수) AWS Account alias 이름."
  type        = string
  nullable    = false
}

variable "password_policy" {
  description = "(선택) AWS Account Password 정책. Default: `CIS 1.4.0`"
  type = object({
    minimum_password_length        = optional(number, 14)
    require_numbers                = optional(bool, true)
    require_symbols                = optional(bool, true)
    require_lowercase_characters   = optional(bool, true)
    require_uppercase_characters   = optional(bool, true)
    allow_users_to_change_password = optional(bool, true)
    hard_expiry                    = optional(bool, false)
    max_password_age               = optional(number, 90)
    password_reuse_prevention      = optional(number, 24)
  })
  default  = {}
  nullable = false
}
