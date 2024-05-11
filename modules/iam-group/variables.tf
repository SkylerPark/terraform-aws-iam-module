variable "name" {
  description = "(필수) IAM group 이름."
  type        = string
  nullable    = false
}

variable "path" {
  description = "(선택) IAM group path Default: `/`."
  type        = string
  nullable    = false
  default     = "/"
}

variable "assumable_roles" {
  description = "(선택) 그룹이 맡을수 있는 IAM 역할 목록."
  type        = list(string)
  default     = []
}

variable "policies" {
  description = "(선택) 그룹에 연결할 IAM 정책 ARN 목록."
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "(선택) IAM 그룹에 연결할 인라인 IAM 정책 맵."
  type        = map(string)
  default     = {}
}
