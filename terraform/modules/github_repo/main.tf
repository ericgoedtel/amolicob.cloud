resource "github_repository" "this" {
  name        = var.name
  description = var.description
}

# resource "github_repository_ruleset" "this" {}
