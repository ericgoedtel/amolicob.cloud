variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "description" {
  type        = string
  description = "Description of the repository"
}

variable "allow_merge_commit" {
  description = "Whether to allow merge commits."
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Whether to allow squash merges."
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Whether to allow rebase merges."
  type        = bool
  default     = false
}

variable "include_repos" {
  description = "List of branches to include in the ruleset."
  type        = list(string)
  default     = ["~DEFAULT_BRANCH"]
}

variable "exclude_repos" {
  description = "List of branches to include in the ruleset."
  type        = list(string)
  default     = []
}

variable "dismiss_stale_reviews" {
  description = "Whether to dismiss stale reviews when new commits are pushed."
  type        = bool
  default     = true
}

variable "require_code_owner_review" {
  description = "Whether to require code owner reviews."
  type        = bool
  default     = true
}

variable "required_approving_review_count" {
  description = "Number of required approving reviews."
  type        = number
  default     = 0
}
