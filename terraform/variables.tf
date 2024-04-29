variable "access_key_id" {}
variable "secret_key_id" {}

variable "github_access_token" {}
variable "runner_repo_url" {}
variable "runner_scope" {}
variable "runner_labels" {}
variable "runner_name_prefix" {}

variable "image_id" {
  type    = string
  default = "ami-bb490c7e"  # available on eu-west-2 (ami-5acc478e for us-east-2)
}

variable "volume_size" {
  type    = number
  default = 100
}

variable "vm_type" {
  type    = string
  default = "tinav4.c4r16p2"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}
