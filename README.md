# umbr - Umbrella

Harden Debian based hosts.

```shell
cd terraform
terraform init
terraform plan
terraform apply
```

## Harden

1. `firewalld` - Install basic firewall
1. `ssh` - Secure SSH daemon:
  1. Disable root login
  1. Disable passwords
  1. Only allow user in group `ssh`
1. Create `user`
  1. `sudo` - Install and allow users in group `adm`
  1. Create `user` in groups `adm` and `ssh`
  1. Add Public SSH key to `authorized_keys`
1. `unattend-updates`  Install
1. `apt full-upgrade`

```shell
cd ansible
ansible-playbook --ask-vault-pass linode.yml
```
