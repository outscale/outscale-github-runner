
.PHONY: packer
packer:
	@sh -c "cd packer && packer init ."
	@sh -c "cd packer && packer build ."

.PHONY: terraform
terraform:
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform apply"

.PHONY: terraform-destroy
terraform-destroy:	
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform destroy"