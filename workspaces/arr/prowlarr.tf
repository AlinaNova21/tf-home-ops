locals {
  tags = ["anime", "movies", "tv"]
}

resource "prowlarr_tag" "tags" {
  for_each = toset(local.tags)
  label    = each.value
}

resource "prowlarr_notification_discord" "monitoring" {
  on_health_issue       = true
  on_application_update = true
  on_health_restored    = true
  on_grab               = true

  include_health_warnings = true
  name                    = "Discord #monitoring"

  web_hook_url = local.discord_monitoring_webhook
  username     = "Prowlarr"
  avatar       = "https://github.com/NX211/homer-icons/raw/master/png/prowlarr.png"
  grab_fields  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
}
