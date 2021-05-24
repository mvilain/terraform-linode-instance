# outputs:
#  id
#  status
#  ip_address
#  private_ip_address
#  ipv6
#  ipv4
#  specs.0.disk
#  specs.0.memory
#  specs.0.vcpus
#  specs.0.transfer
#  backups (enabled, schedule, day, window)

output "id" {
  value     = linode_instance.this.id
}

output "ip_address" {
  value     = linode_instance.this.ip_address
}

output "private_ip_address" {
  value     = linode_instance.this.private_ip_address
}

output "ipv6" {
  value     = linode_instance.this.ipv6
}

output "ipv4" {
  value     = linode_instance.this.ipv4
}

output "backups" {
  value     = linode_instance.this.backups
}
