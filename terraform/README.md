## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amolicob_cloud"></a> [amolicob\_cloud](#module\_amolicob\_cloud) | ./modules/github_repo | n/a |
| <a name="module_applications"></a> [applications](#module\_applications) | ./modules/github_repo | n/a |
| <a name="module_playbooks"></a> [playbooks](#module\_playbooks) | ./modules/github_repo | n/a |

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.dkim_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.dmarc_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.spf_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | API token for interacting with CloudFlare | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Zone ID for this domain | `string` | n/a | yes |

## Outputs

No outputs.
