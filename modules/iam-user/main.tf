resource "aws_iam_user" "this" {
  name          = var.name
  path          = var.path
  force_destroy = var.force_destroy

  permissions_boundary = var.permissions_boundary

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = var.groups
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.assumable_roles
  }
}

resource "aws_iam_user_policy" "assume_role" {
  count = length(var.assumable_roles) > 0 ? 1 : 0

  user   = aws_iam_user.this.name
  name   = "assume-role"
  policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_user_policy_attachment" "managed" {
  for_each = toset(var.policies)

  user       = aws_iam_user.this.name
  policy_arn = each.key
}

resource "aws_iam_user_policy" "inline" {
  for_each = var.inline_policies

  user   = aws_iam_user.this.name
  name   = each.key
  policy = each.value
}
