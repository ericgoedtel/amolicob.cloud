variable "cloudflare_api_token" {
  description = "API token for interacting with CloudFlare"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Zone ID for this domain"
  type        = string
}

variable "github_api_token" {
  description = "API token for access to the repo"
  type        = string
}
