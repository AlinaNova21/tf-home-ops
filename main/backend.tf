terraform {
  cloud {
    organization = "Whoverse"

    workspaces {
      name = "tf-home-ops"
    }
  }
}