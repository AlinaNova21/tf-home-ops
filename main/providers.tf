terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
     sops = {
      source = "carlpett/sops"
      version = "1.0.0"
    }
  }
}

provider "github" {
  owner = "alinanova21"
}
provider "sops" {}