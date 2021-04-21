terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.16.0"
    }
  }
}


provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "vps" {
  region    = "eu-central"
  type      = "g6-nanode-1"
  label     = "linode01"
  root_pass = var.root_password
  image     = "linode/debian10"
  authorized_keys = [
    var.authorized_key,
  ]

  provisioner "remote-exec" {
    inline = [
      "apt-get -q update",
      "apt-get install -y sudo python3 aptitude",
      # Create user ansible
      "useradd -G ssh,sudo -m ansible",
      "mkdir -v -m 700 /home/ansible/.ssh",
      "cp -v /root/.ssh/authorized_keys /home/ansible/.ssh/authorized_keys",
      "chmod -v 600 /home/ansible/.ssh/authorized_keys",
      "chown -vR ansible:ansible /home/ansible/.ssh",
      "echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible",
      "echo Done...",
    ]

    connection {
      host = self.ip_address
      type = "ssh"
      user = "root"
    }
  }
}
