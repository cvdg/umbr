output "public_ip" {
  value       = linode_instance.vps.ip_address
  description = "Public IP address"
}
