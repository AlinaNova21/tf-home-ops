terraform {
  required_providers {
    prowlarr = {
      source  = "devopsarr/prowlarr"
      version = "2.0.0"
    }
    radarr = {
      source  = "devopsarr/radarr"
      version = "2.0.1"
    }
    sonarr = {
      source  = "devopsarr/sonarr"
      version = "3.1.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
  }
}

provider "sops" {}
provider "prowlarr" {
  api_key = data.sops_file.secrets.data.prowlarr_key
  url     = "http://media/prowlarr"
}

provider "sonarr" {
  alias   = "anime"
  url     = "http://media/sonarr/anime"
  api_key = data.sops_file.secrets.data.sonarr_anime_key
}

provider "sonarr" {
  alias   = "hd"
  url     = "http://media/sonarr/hd"
  api_key = data.sops_file.secrets.data.sonarr_hd_key
}

provider "radarr" {
  alias   = "anime"
  url     = "http://media/radarr/anime"
  api_key = data.sops_file.secrets.data.radarr_anime_key
}

provider "radarr" {
  alias   = "hd"
  url     = "http://media/radarr/hd"
  api_key = data.sops_file.secrets.data.radarr_hd_key
}

provider "radarr" {
  alias   = "uhd"
  url     = "http://media/radarr/uhd"
  api_key = data.sops_file.secrets.data.radarr_uhd_key
}
