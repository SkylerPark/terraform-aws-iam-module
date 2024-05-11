# github-trusted-iam-role

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oidc_provider"></a> [oidc\_provider](#module\_oidc\_provider) | ../../modules/iam-oidc-identity-provider | n/a |
| <a name="module_role"></a> [role](#module\_role) | ../../modules/iam-role | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | IAM OIDC Identity Provider 정보. |
| <a name="output_roles"></a> [roles](#output\_roles) | IAM Role 정보. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
