module "oidc_provider" {
  source = "../../modules/iam-oidc-identity-provider"

  url       = "https://token.actions.githubusercontent.com"
  audiences = ["sts.amazonaws.com"]

  auto_thumbprint_enabled = true
}

module "role" {
  source = "../../modules/iam-role"

  name = "github-readonly"

  trusted_oidc_provider_policies = [
    {
      url = "token.actions.githubusercontent.com"
      conditions = [
        {
          key       = "aud"
          condition = "StringEquals"
          values    = ["sts.amazonaws.com"]
        },
        {
          key       = "sub"
          condition = "StringLike"
          values    = ["repo:SkylerPark/*"]
        },
      ]
    }
  ]
  policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
