.PHONY: terraform
terraform:
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform apply --var-file terraform.tfvars"

.PHONY: terraform-destroy
terraform-destroy: omi
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform destroy --var-file terraform.tfvars"