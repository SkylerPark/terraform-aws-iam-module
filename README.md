# terraform-aws-iam-module

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Component

아래 도구를 이용하여 모듈작성을 하였습니다. 링크를 참고하여 OS 에 맞게 설치 합니다.

> **macos** : ./bin/install-macos.sh

- [pre-commit](https://pre-commit.com)
- [terraform](https://terraform.io)
- [tfenv](https://github.com/tfutils/tfenv)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [tfsec](https://github.com/tfsec/tfsec)
- [tflint](https://github.com/terraform-linters/tflint)

## Services

Terraform 모듈을 사용하여 아래 서비스를 관리 합니다.

- **AWS IAM (Identity and Access Management)**
  - iam-user
  - iam-policy
  - iam-group
  - iam-role
  - iam-oidc-identity-provider

## Usage

아래 예시를 활용하여 작성가능하며 examples 코드를 참고 부탁드립니다.

### iam-users

IAM User 를 여러개 생성 하는 예시 입니다.

```hcl
locals {
  users = ["test1", "test2"]
}

module "users" {
  source   = "../../modules/iam-user"
  for_each = toset(local.users)
  name     = each.key
}
```

### iam-role

IAM User 생성 하고 IAM Role 에 Trust 에 연결하는 예시 입니다.

```hcl
module "user" {
  source = "../../modules/iam-user"
  name   = "test1"
  inline_policies = {
    "test1-policy" = jsonencode({
      Statement = [
        {
          Action = [
            "sts:AssumeRole",
          ]
          Effect = "Allow"
          Condition = {
            IpAddress = {
              "aws:SourceIp" = [
                "1.1.1.1/24"
              ]
            }
          }
          Resource = module.role.arn
        },
      ]
    })
  }
}

module "role" {
  source = "../../modules/iam-role"
  name   = "test-role"
  trusted_iam_entity_policies = [
    {
      iam_entities        = [module.user.arn]
      source_ip_whitelist = ["1.1.1.1/32"]
    }
  ]
  policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}
```
