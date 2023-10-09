resource "cloudflare_record" "bsky_did" {
  for_each        = var.users
  allow_overwrite = false
  name            = "_atproto.${each.key}"
  proxied         = false
  ttl             = 1
  type            = "TXT"
  value           = "did=${each.value}"
  zone_id         = var.cf_zone
}
