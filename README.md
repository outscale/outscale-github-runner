# Outscale Self-Hosted Github Runner 


## TODO
- [ ] 

## Install
- Need `packer` and `terraform`

## Run
In order to create the OMI, you will need some environment variable

| Env | Default | Description
| --- | --- | ---
| `OUTSCALE_ACCESSKEYID` | None | **required** Outscale Access Key (see [here](https://docs.outscale.com/en/userguide/Getting-Information-About-Your-Access-Keys.html))
| `OUTSCALE_SECRETKEYID` | None | **required** Outscale Secret Key (see [here](https://docs.outscale.com/en/userguide/Getting-Information-About-Your-Access-Keys.html))
| `OUTSCALE_REGION` | eu-west-2 | Outscale Region

Then, just run this command
```bash
make packer
```

### Terraform
First, you also need to provide variables for the runner configuration in a file in `terraform` folder named `terraform.tfvars`
```
github_access_token=<TOKEN>
runner_scope="org|repo"
runner_repo_url="<GITHUB_URL>"
```

Then, just run this command
```bash
make terraform
```

## License

> Copyright Outscale SAS
>
> BSD-3-Clause

This project is compliant with [REUSE](https://reuse.software/).