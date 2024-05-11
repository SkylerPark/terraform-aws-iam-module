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
