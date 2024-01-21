resource "digitalocean_droplet" "digitalocean1" {
  name              = "digitalocean1"
  image             = "ubuntu-22-04-x64"
  size              = "s-1vcpu-512mb-10gb"
  region            = "nyc1"
  graceful_shutdown = true
  locked            = true
  tags = [
    "tf-home-ops",
    "tailscale",
    "tailscale-exit-node",
  ]
}

import {
  to = digitalocean_droplet.digitalocean1
  id = "396774911"
}
