resource "aws_iam_role" "this" {
  name                  = var.name
  path                  = var.path
  description           = var.description
  max_session_duration  = var.max_session_duration
  force_detach_policies = var.force_detach_policies
  permissions_boundary  = var.permissions_boundary

  assume_role_policy = data.aws_iam_policy_document.trusted_entities.json

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )
}

data "aws_iam_policy_document" "trusted_entities" {
  source_policy_documents = concat(
    values(data.aws_iam_policy_document.trusted_iam_entity_policies)[*].json,
    values(data.aws_iam_policy_document.trusted_service_policies)[*].json,
    values(data.aws_iam_policy_document.trusted_oidc_provider_policies)[*].json,
    values(data.aws_iam_policy_document.trusted_saml_provider_policies)[*].json,
  )
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.assumable_roles
  }
}

resource "aws_iam_role_policy" "assume_role" {
  count = length(var.assumable_roles) > 0 ? 1 : 0

  role   = aws_iam_role.this.id
  name   = "assume-role"
  policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.policies)

  role       = aws_iam_role.this.id
  policy_arn = each.key
}

resource "aws_iam_role_policy" "inline" {
  for_each = var.inline_policies

  role   = aws_iam_role.this.id
  name   = each.key
  policy = each.value
}

resource "aws_iam_instance_profile" "this" {
  count = var.instance_profile.enabled ? 1 : 0

  role = aws_iam_role.this.name

  name = coalesce(var.instance_profile.name, var.name)
  path = var.instance_profile.path

  tags = merge(
    {
      "Name" = coalesce(var.instance_profile.name, var.name)
    },
    var.tags,
    var.instance_profile.tags,
  )
}
