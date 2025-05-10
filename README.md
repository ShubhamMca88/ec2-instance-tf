# Multi-Purpose EC2 Instance using Terraform

This project provisions an EC2 instance in AWS for personal, multi-purpose use using Terraform.

## Features

- Auto SSH key import
- Security group with SSH access
- Encrypted root volume (gp3)
- Custom tags and names
- Fully modular and clean structure

## Prerequisites

- AWS CLI configured
- Terraform >= 1.3
- SSH key pair (public key in `.pem` format)

## How to Use

```bash
terraform init
terraform plan -var="ami_id=ami-xxxxxx" \
               -var="instance_name=my-ec2" \
               -var="key_name=my-key" \
               -var="public_key_path=~/.ssh/id_rsa.pub" \
               -var="vpc_id=vpc-xxxx" \
               -var="subnet_id=subnet-xxxx"
terraform apply
