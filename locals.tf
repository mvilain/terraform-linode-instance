
locals {
  instance_label = "${var.label}_instance_${random_string.rando.result}"
  config_dir     = "gitlab-config/"
}
