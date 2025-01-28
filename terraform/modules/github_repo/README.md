## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_ruleset.basic_branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Whether to allow merge commits. | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Whether to allow rebase merges. | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Whether to allow squash merges. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | n/a | yes |
| <a name="input_dismiss_stale_reviews"></a> [dismiss\_stale\_reviews](#input\_dismiss\_stale\_reviews) | Whether to dismiss stale reviews when new commits are pushed. | `bool` | `true` | no |
| <a name="input_exclude_repos"></a> [exclude\_repos](#input\_exclude\_repos) | List of branches to include in the ruleset. | `list(string)` | `[]` | no |
| <a name="input_include_repos"></a> [include\_repos](#input\_include\_repos) | List of branches to include in the ruleset. | `list(string)` | <pre>[<br/>  "~DEFAULT_BRANCH"<br/>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_require_code_owner_review"></a> [require\_code\_owner\_review](#input\_require\_code\_owner\_review) | Whether to require code owner reviews. | `bool` | `true` | no |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | Number of required approving reviews. | `number` | `0` | no |

## Outputs

No outputs.
