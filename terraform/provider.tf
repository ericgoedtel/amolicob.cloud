terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  backend "remote" {
    organization = "ericgoedtel"
    workspaces {
      name = "amolicob_cloud"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

locals {
  assumed_role_arn = var.assumed_role_arn != "" ? var.assumed_role_arn : "arn:aws:iam::868840956234:role/amolicob_role"
}

provider "aws" {
  region = "us-east-1"

  dynamic "assume_role" {
    for_each = var.is_tfc ? [] : [1]
    content {
      role_arn = local.assumed_role_arn
    }
  }
}
