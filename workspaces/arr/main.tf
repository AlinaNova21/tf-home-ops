locals {
  discord_webhook = data.sops_file.secrets.data.discord_webhook
}

data "sops_file" "secrets" {
  source_file = "secrets.sops.yaml"
}

module "sonarr_anime" {
  name                 = "Anime"
  source               = "../../modules/sonarr"
  api_url              = "http://media/sonarr/anime"
  api_key              = data.sops_file.secrets.data.sonarr_anime_key
  discord_web_hook_url = local.discord_webhook
  providers = {
    sonarr = sonarr.anime
  }
}

module "sonarr_hd" {
  name                 = "HD"
  source               = "../../modules/sonarr"
  api_url              = "http://media/sonarr/hd"
  api_key              = data.sops_file.secrets.data.sonarr_hd_key
  discord_web_hook_url = local.discord_webhook
  providers = {
    sonarr = sonarr.hd
  }
}

module "radarr_anime" {
  name                 = "Anime"
  source               = "../../modules/radarr"
  api_url              = "http://media/radarr/anime"
  api_key              = data.sops_file.secrets.data.radarr_anime_key
  discord_web_hook_url = local.discord_webhook
  providers = {
    radarr = radarr.anime
  }
}
module "radarr_hd" {
  name                 = "HD"
  source               = "../../modules/radarr"
  api_url              = "http://media/radarr/hd"
  api_key              = data.sops_file.secrets.data.radarr_hd_key
  discord_web_hook_url = local.discord_webhook
  providers = {
    radarr = radarr.hd
  }
}
module "radarr_uhd" {
  name                 = "UHD"
  source               = "../../modules/radarr"
  api_url              = "http://media/radarr/uhd"
  api_key              = data.sops_file.secrets.data.radarr_uhd_key
  discord_web_hook_url = local.discord_webhook
  providers = {
    radarr = radarr.uhd
  }
}