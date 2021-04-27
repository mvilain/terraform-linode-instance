resource "linode_instance" "my_linode_instance" {
  label            = local.instance_label
  image            = var.image
  region           = var.region
  type             = var.type
  authorized_keys  = [ chomp(var.ssh_key) ]
  root_pass        = var.password
#  authorized_keys  = [ chomp(tls_private_key.ssh.public_key_openssh) ]
#  root_pass        = random_password.password.result
  tags             = [ var.label ]
  watchdog_enabled = true

  provisioner "local-exec" {
    command = "echo ${var.label} ansible_host=${self.ip_address} >> inventory"
  }

  # update the sshd file
  provisioner "remote-exec" {
    inline = [
#      "apt-get update",
#      "apt-get install python3 -y",
      "echo ${var.label} running..."
      ]
    connection {
      host        = self.ip_address
      type        = "ssh"
      user        = "root"
      password    = var.password
    }
  }
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
