terraform {
  required_providers {
    prowlarr = {
      source  = "devopsarr/prowlarr"
      version = "2.0.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
  }
}

provider "prowlarr" {
  api_key = data.sops_file.secrets.prowlarr_key
  url     = "http://media/prowlarr"
}
provider "sops" {}
