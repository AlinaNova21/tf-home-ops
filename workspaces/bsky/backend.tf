terraform {
  cloud {
    organization = "Whoverse"

    workspaces {
      name = "bsky"
    }
  }
}
