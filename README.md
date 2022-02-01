# Outscale Self-Hosted Github Runner 


## TODO
- [ ] 

## Requirements
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli): >=1.1.0
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html): >=2.11.7

## Deploy
First, you also need to provide variables for the runner configuration in a file in `terraform` folder named `terraform.tfvars`
```hcl
github_access_token="<TOKEN>"
runner_scope="org|repo"
runner_repo_url="<GITHUB_URL>"
```

Then, just run this command
```bash
make terraform
```

## Uninstall
```bash
make terraform-destroy
```
## License

> Copyright Outscale SAS
>
> BSD-3-Clause

This project is compliant with [REUSE](https://reuse.software/).