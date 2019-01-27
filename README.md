
## Terraform/Ansible provisioning script to create an AWS EC2 instance and run an Nginx docker container inside.    

## Details

This repository sets up:

* A VPC
* public and private subnets
* An internet gateway
* Security groups
* A publicly-accessible EC2 instance with Ubuntu 18.04
* Within the EC2 instance:
   * Nginx docker container


## Prerequisits
- Install the following locally:
provissioning
    * [Terraform](https://www.terraform.io/) >= 0.10.0
    * [Terraform Inventory](https://github.com/adammck/terraform-inventory)
    * [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    * Ensure you add the key pair from aws to `terraform/keys` folder.


## Structure
```
.
├── ansible
│   ├── ansible.cfg
│   ├── playbook.retry
│   ├── playbook.yml
│   ├── scripts
│   │   ├── nginx-fetch-output.sh
│   │   ├── nginx-healthcheck.sh
│   │   └── nginx-stats.sh
│   └── static-files
│       ├── 50x.html
│       └── index.html
├── deploy.sh
├── destroy.sh
├── README.md
└── terraform
    ├── instances
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── keys
    │   
    ├── main.tf
    ├── network
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── sg_groups.tf
    │   └── variables.tf
    ├── outputs.tf
    └── variables.tf

```

## Usage

```sh
./deploy.sh
```

## Cleanup

```sh
./destroy.sh
```

## Notes
**A script to show the health of the nginx container exists in `/home/ubuntu/.scripts/nginx-healthcheck.sh` folder.**

```sh
root@ip-172-22-253-15:/home/ubuntu/.scripts# ./nginx-healthcheck.sh 
Nginx healthy!
```
**A script to fetch the output of the nginx default HTTP page and print out the word that occurs most on the page (exclude HTML tags) exists in `/home/ubuntu/.scripts/nginx-fetch-output.sh` folder.**

```sh
root@ip-172-22-253-15:/home/ubuntu/.scripts# ./nginx-fetch-output.sh 
Word that occurs most on the page:  is
```
**Resource usage of the nginx container exists in `/home/ubuntu/.nginx/stats/resource-log.html` and the usage automaticatlly updates every 10 seconds.**

```
root@ip-172-22-253-15:/home/ubuntu/.nginx/stats# cat resource-log.html 
{"container":"nginx","memory":{"raw":"2.16MiB / 983.9MiB","percent":"0.22%"},"cpu":"0.00%"}
```
**Resource usage of the nginx container `/home/ubuntu/.nginx/stats/resource-log.html` also served via nginx in http://<PUBLIC_DNS>/stats/resource-log.html**

root@ip-172-22-253-15:/home/ubuntu/.nginx/stats# curl http://<PUBLIC_DNS>/stats/resource-log.html
{"container":"nginx","memory":{"raw":"2.164MiB / 983.9MiB","percent":"0.22%"},"cpu":"0.00%"}

**Additional Notes**

You can add `terraform/terraform.tfvars` which contais runtime variables. If you don't have this file in place terraform will prompt for these values in the runtime.
```
access_key = "<access_key>"
secret_key = "<secret_key>"
region = "us-east-2"
aws_key_path = "<path_to_key>"
aws_key_name = "<key_name>"

