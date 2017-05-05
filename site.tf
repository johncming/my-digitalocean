variable "do_token" {}

variable "subdomain" {}

variable "ssh_keys" {
  type = "list"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "vpn" {
  image  = "ubuntu-16-04-x64"
  name   = "vpn"
  region = "nyc1"
  size   = "512mb"
  ssh_keys = ["${var.ssh_keys}"]
}

resource "digitalocean_domain" "vpn" {
  name       = "${var.subdomain}"
  ip_address = "${digitalocean_droplet.vpn.ipv4_address}"
}
