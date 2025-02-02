resource "cloudflare_record" "spf_record" {
  zone_id = var.cloudflare_zone_id
  name    = "amolicob.cloud"
  type    = "TXT"
  content = "\"v=spf1 -all\""
  ttl     = 3600
}

resource "cloudflare_record" "dkim_record" {
  zone_id = var.cloudflare_zone_id
  name    = "*._domainkey"
  type    = "TXT"
  content = "\"v=DKIM1; p=\""
  ttl     = 3600
}

resource "cloudflare_record" "dmarc_record" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = "\"v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:111acc016fdc416e9b340c9d22106a8a@dmarc-reports.cloudflare.net;\""
  ttl     = 3600
}

module "amolicob_cloud" {
  source = "./modules/github_repo"

  name        = "amolicob.cloud"
  description = "Infrastructure and code related to my other public domain"
}

module "applications" {
  source = "./modules/github_repo"

  name        = "applications"
  description = "ArgoCD applications for my labs"

  include_repos = ["main", "develop"]
}

module "playbooks" {
  source = "./modules/github_repo"

  name        = "playbooks"
  description = "Infrastructure playbooks for homelab equipment"
}

import {
  for_each = toset(["main", "develop"])
  to       = module.applications.github_branch.this[each.key]
  id       = "applications:${each.key}"
}

import {
  for_each = toset(["main"])
  to       = module.playbooks.github_branch.this[each.key]
  id       = "playbooks:${each.key}"
}

import {
  for_each = toset(["main"])
  to       = module.amolicob_cloud.github_branch.this[each.key]
  id       = "amolicob.cloud:${each.key}"
}

