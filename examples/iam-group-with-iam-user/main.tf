module "group" {
  source   = "../../modules/iam-group"
  name     = "test-group"
  policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

locals {
  users = ["test1", "test2"]
}

module "users" {
  source   = "../../modules/iam-user"
  for_each = toset(local.users)
  name     = each.key
  groups   = [module.group.name]
}
