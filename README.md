# Outscale Self-Hosted Github Runner 


## TODO
- [ ] 

## Requirements
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli): >=1.1.0
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html): >=2.11.7

## Deploy
### Runner for a single repository
```
cp terraform/terraform.tfvars.repo.example terraform/terraform.tfvars
```

### Runner for an organisation
```
cp terraform/terraform.tfvars.org.example terraform/terraform.tfvars
````

Then replace the following variables:
- `github_access_token`: The `TOKEN` can be generated in  `Settings` > `Developer settings` > `Personal access tokens`. (See [Docs](https://github.com/myoung34/docker-github-actions-runner#create-github-personal-access-token) for more information)
- `runner_repo_url`

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