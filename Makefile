
.PHONY: packer
packer:
	@sh -c "cd packer && packer init ."
	@sh -c "cd packer && packer build ."

.PHONY: omi
omi:
	@./scripts/compute_image_id.sh

.PHONY: terraform
terraform: omi
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform apply --var-file omi.tfvars --var-file terraform.tfvars"

.PHONY: terraform-destroy
terraform-destroy: omi
	@sh -c "cd terraform && terraform init"
	@sh -c "cd terraform && terraform destroy --var-file omi.tfvars --var-file terraform.tfvars"