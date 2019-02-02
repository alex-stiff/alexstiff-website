# AWS credentials
variable "aws_region" {
  default = "eu-west-2"
}

variable "access_key" {} # From secret.tfvars

variable "secret_key" {} # From secret.tfvars

# S3
variable "site_name" {
  default = "alexstiff.com"
}
