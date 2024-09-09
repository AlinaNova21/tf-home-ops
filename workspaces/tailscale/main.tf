resource "digitalocean_droplet" "digitalocean1" {
  name              = "digitalocean1"
  image             = "ubuntu-22-04-x64"
  size              = "s-1vcpu-512mb-10gb"
  region            = "nyc1"
  graceful_shutdown = true
  tags = [
    "tf-home-ops",
    "tailscale",
    "tailscale-exit-node",
  ]
}
resource "digitalocean_firewall" "digitalocean1" {
  name = "plex"

  droplet_ids = [digitalocean_droplet.digitalocean1.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "32400"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

import {
  to = digitalocean_droplet.digitalocean1
  id = "396774911"
}
