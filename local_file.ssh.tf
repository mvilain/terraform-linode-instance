# 
# resource "local_file" "public_ssh" {
#   content         = tls_private_key.ssh.public_key_openssh
#   filename        = "id_rsa.pub"
#   file_permission = "0600"
# }
# 
# resource "local_file" "private_ssh" {
#   content         = tls_private_key.ssh.private_key_pem
#   filename        = "id_rsa"
#   file_permission = "0600"
# }
# 
# resource "local_file" "root_passwd" {
#   content         = random_password.password.result
#   filename        = "root-passwd"
#   file_permission = "0600"
# }
