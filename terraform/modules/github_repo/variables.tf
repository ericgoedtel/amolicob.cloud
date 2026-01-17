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

variable "default_branch" {
  description = "The name of the default branch"
  type        = string
  default     = "main"
}

variable "create_branches" {
  description = "List of additional branches to create in the repo."
  type        = list(string)
  default     = []
}

variable "include_branches" {
  description = "List of branches to include in all rulesets."
  type        = list(string)
  default     = ["main"]
}

variable "exclude_branches" {
  description = "List of branches to exclude in the ruleset."
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

variable "required_status_checks" {
  type    = list(string)
  default = []
}


variable "block_deletion" {
  description = "Whether protected branches should be deletable"
  type        = bool
  default     = true
}

variable "archived" {
  description = "Whether the repository is archived"
  type        = bool
  default     = false
}

variable "visibility" {
  description = "The visibility of the repository: public, private, or internal"
  type        = string
  default     = "public"
}
