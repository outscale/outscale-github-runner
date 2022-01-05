resource "shell_script" "configure_runner" {
  lifecycle_commands {
    create = <<-EOF
      ANSIBLE_CONFIG=ansible.cfg ansible-playbook -e "token=${var.github_access_token}" -e "repo_url=${var.runner_repo_url}" -e "runner_scope=${var.runner_scope}"  -e "org_name=$(echo ${var.runner_repo_url} | sed -r 's%^.*github\.com/([^/]+)/?.*%\1%')" env_file/playbook.yml
    EOF
    update = <<-EOF
      ANSIBLE_CONFIG=ansible.cfg ansible-playbook -e "token=${var.github_access_token}" -e "repo_url=${var.runner_repo_url}" -e "runner_scope=${var.runner_scope}"  -e "org_name=$(echo ${var.runner_repo_url} | sed -r 's%^.*github\.com/([^/]+)/?.*%\1%')" env_file/playbook.yml
    EOF
    read   = <<-EOF
        echo "{\"file\": \"$(cat env_file/playbook.yml|base64)\",
               \"check\": \"$(ANSIBLE_CONFIG=ansible.cfg ansible-playbook --check env_file/playbook.yml|base64)\"
              }"
    EOF
    delete = "ANSIBLE_CONFIG=ansible.cfg ansible-playbook env_file/playbook-destroy.yml"
  }
  depends_on = [outscale_vm.my_vm, local_file.ssh_config]
}