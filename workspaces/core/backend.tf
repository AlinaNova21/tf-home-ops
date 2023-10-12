terraform {
  cloud {
    organization = "Whoverse"

    workspaces {
      name = "core"
    }
  }
}