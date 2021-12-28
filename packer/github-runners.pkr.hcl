packer {
  required_plugins {
    outscale = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/outscale"
    }
  }
}


variable "omi_name" {
  type    = string
  default = "${env("OMI_NAME")}"
}

variable "omi" {
  type    = string
  default = "${env("SOURCE_OMI")}"
}

variable "region" {
  type    = string
  default = "${env("OUTSCALE_REGION")}"
}
variable "username" {
  type    = string
  default = "outscale"
}

variable "access_key" {
  type    = string
  default = "${env("OUTSCALE_ACCESSKEYID")}"
}

variable "secret_key" {
  type    = string
  default = "${env("OUTSCALE_SECRETKEYID")}"
}

source "osc-bsu" "github-runners" {
  vm_type      = "tinav4.c2r4p1"
  omi_name     = "github-runners"
  source_omi   = "${var.omi}"
  ssh_username = var.username
}

build {
  name = "github-runners"
  sources = [
    "source.osc-bsu.github-runners"
  ]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }

}