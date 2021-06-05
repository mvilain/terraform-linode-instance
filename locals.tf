
locals {
  instance_label = "${var.label}_instance_${random_string.rando.result}"
  tmp            = trimprefix("${var.image}", "linode/")
  tmp2           = trimsuffix("${local.tmp}", "lts")
  os_tag         = trimsuffix("${local.tmp2}", ".04")
}
