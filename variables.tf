variable "password" {
  type        = string
  description = "The root password used to create the instance"
}

variable "ssh_key" {
  type        = string
  description = "The ssh public key used in instance's authorized_hosts'"
}

variable "image" {
  type        = string
  description = "Linode Image type to use"
  default     = "linode/ubuntu18.04"
}

variable "region" {
  type        = string
  description = "The Linode region to use"
  default     = "us-west"
}

variable "type" {
  type        = string
  description = "The image size type to use"
  default     = "g6-nanode-1"
}

variable "label" {
  type        = string
  description = "The label used to create the instance and hostname"
  default     = "example"
}

variable "domain" {
  type        = string
  description = "pre-existing Linode-managed DNS domain to assign public IP of created instance"
  default     = "example.com"
}
