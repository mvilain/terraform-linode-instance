output "ssh" {
  value     = tls_private_key.ssh
  sensitive = true

}

output "password" {
  value     = random_password.password
  sensitive = true
}

output "id" {
  value     = linode_instance.my_linode_instance.id
#  sensitive = true
}

output "ip_address" {
  value     = linode_instance.my_linode_instance.ip_address
}
