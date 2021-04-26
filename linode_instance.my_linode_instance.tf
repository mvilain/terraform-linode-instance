resource "linode_instance" "my_linode_instance" {
  label            = local.instance_label
  image            = var.image
  region           = var.region
  type             = var.type
  authorized_keys  = [ chomp(tls_private_key.ssh.public_key_openssh) ]
  root_pass        = random_password.password.result
  tags             = [ var.label ]
  watchdog_enabled = true
#  alerts.0.cpu     = 0
#    io             = 0
#    network_in     = 0
#    network_out    = 0
#    transfer_quota = 0
#  }
}
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