variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "vpn" {
  image  = "ubuntu-16-04-x64"
  name   = "vpn"
  region = "nyc1"
  size   = "512mb"
  ssh_keys = [8322725]
}

resource "digitalocean_domain" "vpn" {
  name       = "vpn11.johncming.net"
  ip_address = "${digitalocean_droplet.vpn.ipv4_address}"
}
