## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.30.0 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.52.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amolicob_cloud"></a> [amolicob\_cloud](#module\_amolicob\_cloud) | ./modules/github_repo | n/a |
| <a name="module_applications"></a> [applications](#module\_applications) | ./modules/github_repo | n/a |
| <a name="module_mealwhisperer"></a> [mealwhisperer](#module\_mealwhisperer) | ./modules/github_repo | n/a |
| <a name="module_playbooks"></a> [playbooks](#module\_playbooks) | ./modules/github_repo | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.tfc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.amolicob_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.root_takeout_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_user.amolicob_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.amolicob_user_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_s3_bucket.takeout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.takeout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [cloudflare_record.dkim_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.dmarc_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.spf_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.amolicob_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.root_takeout_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.takeout_assumerole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.takeout_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assumed_role_arn"></a> [assumed\_role\_arn](#input\_assumed\_role\_arn) | The ARN of the role to assume. | `string` | `""` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | API token for interacting with CloudFlare | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Zone ID for this domain | `string` | n/a | yes |
| <a name="input_is_tfc"></a> [is\_tfc](#input\_is\_tfc) | Set to true when running in Terraform Cloud. | `bool` | `false` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The name of the Terraform Cloud organization. | `string` | `"ericgoedtel"` | no |
| <a name="input_tfc_project_name"></a> [tfc\_project\_name](#input\_tfc\_project\_name) | The name of the Terraform Cloud project. | `string` | `"amolicob_cloud"` | no |

## Outputs

No outputs.
