terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

provider "github" {
  owner = "alinanova21"
}
provider "sops" {}
provider "cloudflare" {
  api_token = data.sops_file.secrets.data.cloudflare_api_token
}

