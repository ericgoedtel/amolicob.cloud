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
  content = "\"v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;\""
  ttl     = 3600
}
