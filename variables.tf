# AWS credentials
variable "aws_region" {
  default = "eu-west-2"
}

variable "access_key" {} # From secret.tfvars

variable "secret_key" {} # From secret.tfvars

# Route 53
variable "site_name" {
  default = "alexstiff.com"
}

variable "github_pages_ips" {
  default = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}
