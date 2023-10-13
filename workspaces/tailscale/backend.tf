terraform {
  cloud {
    organization = "Whoverse"

    workspaces {
      name = "tailscale"
    }
  }
}
