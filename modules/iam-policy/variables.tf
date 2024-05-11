variable "name" {
  description = "(필수) IAM policy 이름."
  type        = string
  nullable    = false
}

variable "path" {
  description = "(선택) IAM policy path Default: `/`.."
  type        = string
  default     = "/"
  nullable    = false
}

variable "description" {
  description = "(선택) IAM policy 설명."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}

variable "policy" {
  description = "(필수) JSON 형식의 정책 문서."
  type        = string
  nullable    = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}
