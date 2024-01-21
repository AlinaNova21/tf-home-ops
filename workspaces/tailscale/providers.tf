terraform {
  required_providers {
    tailscale = {
      source = "tailscale/tailscale"
      version = "0.13.11"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.34.1"
    }
  }
}

provider "tailscale" {
  scopes = "all"
}

provider "digitalocean" {
  # Configuration options
}