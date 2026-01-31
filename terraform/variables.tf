variable "cloudflare_api_token" {
  description = "API token for interacting with CloudFlare"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Zone ID for this domain"
  type        = string
}

variable "assumed_role_arn" {
  description = "The ARN of the role to assume."
  type        = string
  default     = ""
}

variable "tfc_organization" {
  description = "The name of the Terraform Cloud organization."
  type        = string
  default     = "ericgoedtel"
}

variable "tfc_project_name" {
  description = "The name of the Terraform Cloud project."
  type        = string
  default     = "amolicob_cloud"
}

variable "is_tfc" {
  description = "Set to true when running in Terraform Cloud."
  type        = bool
  default     = false
}
