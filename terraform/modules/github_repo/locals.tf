locals {
  branches = toset(concat(var.include_repos, var.exclude_repos))
}
