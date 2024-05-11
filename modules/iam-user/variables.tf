variable "name" {
  description = "(필수) IAM user 이름."
  type        = string
}

variable "path" {
  description = "(선택) IAM user 경로 Default: `/`"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "(선택) 사용자를 삭제시 Terraform에서 관리하지 않는 IAM 액세스 키, 로그인 프로필 또는 MFA 디바이스가 있더라도 삭제."
  type        = bool
  default     = false
}

variable "permissions_boundary" {
  description = "(선택) 사용자에 대한 권한 경계를 설정하는 데 사용되는 정책의 ARN."
  type        = string
  default     = null
}

variable "groups" {
  description = "(선택) 사용자를 추가할 IAM 그룹 목록."
  type        = list(string)
  default     = []
}

variable "pgp_key" {
  description = "(선택) Base-64로 인코딩된 PGP 공개 키 또는 keybase:username 형식의 키베이스 사용자 이름 비밀번호 및 액세스 키를 암호화하는 데 사용."
  type        = string
  default     = ""
}

variable "console_access" {
  description = <<EOF
  (선택) 사용자의 AWS 콘솔 액세스 및 비밀번호 구성. `console_access` 블록 내용.
    (선택) `enabled` - AWS 콘솔 액세스 및 비밀번호 활성화 여부.
    (선택) `password_length` - 생성된 비밀번호의 길이. Default: `20`.
    (선택) `password_reset_required` -  사용자가 처음 로그인할 때 생성된 비밀번호를 강제로 재설정해야 하는지 여부. Default: `true`.
  EOF
  type        = any
  default     = {}
}

variable "access_keys" {
  description = <<EOF
  (선택) IAM 사용자와 연결할 액세스 키 목록. `access_keys` 블록 내용.
    (필수) `enabled` - 액세스 키 활성화 여부.
  EOF
  type        = list(map(bool))
  default     = []
}

variable "ssh_keys" {
  description = <<EOF
  (선택) IAM 사용자와 연결할 SSH 공개 키 목록. `ssh_keys` 블록 내용.
    (필수) `public_key` - SSH 공개 키입니다. 공개 키는 ssh-rsa 형식 또는 PEM 형식으로 인코딩.
    (선택) `encoding` - 공개 키 인코딩 형식을 지정. 유효한 값 'SSH', 'PEM'. ssh-rsa 형식의 공개 키를 검색하려면 'SSH'를 사용. PEM 형식의 공개 키를 검색하려면 'PEM'을 사용.
    (선택) `enabled` - SSH 공개 키 활성화 여부.
  EOF
  type        = any
  default     = []
}

variable "service_credentials" {
  description = <<EOF
  (선택) IAM 사용자와 연결할 서비스별 자격 증명 목록. `service_credentials` 블록 내용.
    (필수) `service` - 자격 증명과 연결될 AWS 서비스의 이름.
    (선택) `enabled` - 서비스별 자격 증명을 활성화할지 여부.
  EOF
  type        = any
  default     = []
}

variable "assumable_roles" {
  description = "(선택) List of IAM roles ARNs which can be assumed by the user."
  type        = list(string)
  default     = []
}

variable "policies" {
  description = "(선택) 사용자가 맡을 수 있는 IAM 역할 ARN 목록."
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "(선택) IAM 사용자에 연결할 인라인 IAM 정책 맵."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}
