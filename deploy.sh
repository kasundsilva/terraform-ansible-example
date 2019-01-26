#!/bin/bash

set -e
set -x

# set up the infrastructure
cd terraform
terraform init
terraform apply -auto-approve

# provision the instance
cd ../ansible

# pull the instance information from Terraform, and run the Ansible playbook against it to configure
TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" playbook.yml -u ubuntu --private-key ../terraform/keys/qrious.pem
echo "Deployment Success!"

#cd ../terraform
#terraform output