resource "github_repository" "this" {
  name        = var.name
  description = var.description

  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
}

resource "github_repository_ruleset" "basic_branch_protection" {
  repository  = github_repository.this.name
  name        = "basic-branch-protection"
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = var.include_repos
      exclude = var.exclude_repos
    }
  }

  rules {
    deletion = var.block_deletion
    pull_request {
      dismiss_stale_reviews_on_push   = var.dismiss_stale_reviews
      require_code_owner_review       = var.require_code_owner_review
      required_approving_review_count = var.required_approving_review_count
    }
  }
}
