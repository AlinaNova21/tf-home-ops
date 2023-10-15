resource "radarr_notification_discord" "downloads" {
  name                           = "Discord #downloads"
  web_hook_url                   = var.discord_web_hook_url
  avatar                         = "https://github.com/NX211/homer-icons/raw/master/png/radarr.png"
  on_movie_delete                = true
  include_health_warnings        = true
  grab_fields                    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  import_fields                  = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  on_application_update          = true
  on_grab                        = true
  on_download                    = true
  on_health_issue                = true
  on_health_restored             = true
  on_manual_interaction_required = true
  on_movie_file_delete           = true
  on_upgrade                     = true
  on_rename                      = false
  username                       = "Radarr ${var.name}"
}