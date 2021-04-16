variable "linode_token" {}
variable "authorized_key" {}
variable "root_password" {}


terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}

provider "linode" {
    token = var.linode_token
}

resource "linode_instance" "linode01" {
  image = "linode/debian10"
  label = "linode01"
  group = "Terraform"
  region = "eu-central"
  type = "g6-nanode-1"
  authorized_keys = [ var.authorized_key ]
  root_pass = var.root_password
}
