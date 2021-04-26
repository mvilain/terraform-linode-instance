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
  description = "The label used to create the instance"
  default     = "example"
}
