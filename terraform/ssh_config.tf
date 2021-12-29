resource "local_file" "ssh_config" {
  filename        = "${path.root}/ssh_config"
  file_permission = "0660"
  content = format("%s\n",
    format("Host %s\n     HostName %s\n     User outscale\n     IdentityFile %s\n     IdentitiesOnly yes\n     UserKnownHostsFile known_hosts\n     StrictHostKeyChecking accept-new", "runner", outscale_public_ip.my_public_ip.public_ip, local_file.my_key.filename)
  )
}


resource "shell_script" "known_hosts" {
  lifecycle_commands {
    create = <<-EOF
        touch known_hosts
    EOF
    read   = <<-EOF
        echo "{}"
    EOF
    delete = <<-EOF
        rm -f known_hosts
    EOF
  }
  depends_on = [local_file.ssh_config]
}
