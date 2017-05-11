variable "do_token" {}

variable "domain" {
  default = "default.johncming.net"
}

variable "ssh_keys" {
  type = "list"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "default" {
  image  = "ubuntu-16-04-x64"
  name   = "${var.domain}"
  region = "nyc1"
  size   = "512mb"
  ssh_keys = ["${var.ssh_keys}"]
}

resource "digitalocean_domain" "vpn" {
  name       = "${digitalocean_droplet.default.name}"
  ip_address = "${digitalocean_droplet.default.ipv4_address}"
}
