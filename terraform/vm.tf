resource "outscale_vm" "my_vm" {
  image_id                 = var.image_id
  vm_type                  = var.vm_type
  keypair_name             = outscale_keypair.my_keypair.keypair_name
  security_group_ids       = [outscale_security_group.my_sg.security_group_id]
  placement_subregion_name = "${var.region}a"
  placement_tenancy        = "default"

  # resized bootdisk volume
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "100"
      volume_type           = "gp2"
      delete_on_vm_deletion = "true"
    }
  }

  tags {
    key   = "osc.fcu.eip.auto-attach"
    value = outscale_public_ip.my_public_ip.public_ip
  }
  tags {
    key   = "name"
    value = "self-hosted runner for Github"
  }

}