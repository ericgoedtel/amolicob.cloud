resource "github_repository" "this" {
  name        = var.name
  description = var.description

  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
}

resource "github_branch" "this" {
  for_each   = toset(concat([var.default_branch], var.create_branches))
  repository = github_repository.this.name
  branch     = each.key
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_repository_ruleset" "basic_branch_protection" {
  repository  = github_repository.this.name
  name        = "basic-branch-protection"
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = [for item in var.include_branches : "refs/heads/${item}"]
      exclude = [for item in var.exclude_branches : "refs/heads/${item}"]
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

resource "github_repository_ruleset" "required_status_checks" {
  count       = length(var.required_status_checks) > 0 ? 1 : 0
  repository  = github_repository.this.name
  name        = "required-status-checks"
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = [for item in var.include_branches : "refs/heads/${item}"]
      exclude = [for item in var.exclude_branches : "refs/heads/${item}"]
    }
  }

  rules {
    required_status_checks {
      dynamic "required_check" {
        for_each = var.required_status_checks
        content {
          context = required_check.value
        }
      }
    }
  }
}
