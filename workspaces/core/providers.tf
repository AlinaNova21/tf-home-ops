terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.49.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
  }
}

provider "tfe" {
  token = data.sops_file.secrets.data.terraform_token
}
provider "github" {
  owner = "alinanova21"
  token = data.sops_file.secrets.data.github_token
}
provider "sops" {}