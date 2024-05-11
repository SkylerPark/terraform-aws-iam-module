module "account" {
  source = "../../modules/account"
  name   = "parksm-test"

  password_policy = {
    minimum_password_length      = 12
    require_numbers              = true
    require_symbols              = true
    require_lowercase_characters = true
    require_uppercase_characters = true

    allow_users_to_change_password = true
    hard_expiry                    = false
    max_password_age               = 65
    password_reuse_prevention      = 3
  }
}
