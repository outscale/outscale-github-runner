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

```bash
make packer
```

In order to create the OMI, you will need some environment variable

| Env | Default | Description
| --- | --- | ---
| `OUTSCALE_ACCESSKEYID` | None | **required** Outscale Access Key (see [here](https://docs.outscale.com/en/userguide/Getting-Information-About-Your-Access-Keys.html))
| `OUTSCALE_SECRETKEYID` | None | **required** Outscale Secret Key (see [here](https://docs.outscale.com/en/userguide/Getting-Information-About-Your-Access-Keys.html))
| `OUTSCALE_REGION` | eu-west-2 | **required** Outscale Region
| `TF_VAR_github_access_token` |  None | **required** Github Personal Access Token (see [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token))
| `TF_VAR_image_id` |  None | **required** Packer image build from previous build
| `TF_VAR_runner_repo_url` |  None | **required** URL of the repo/org
| `TF_VAR_runner_scope` |  None | **required** Runner for a "repo" or an "org"

```bash
make terraform
```

## License

> Copyright Outscale SAS
>
> BSD-3-Clause

This project is compliant with [REUSE](https://reuse.software/).