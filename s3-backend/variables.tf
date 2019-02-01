# AWS credentials
variable "aws_region" {
  default = "eu-west-2"
}

variable "access_key" {} # From secret.tfvars

variable "secret_key" {} # From secret.tfvars

variable "backend_s3_bucket_name" {
  default = "alexstiff-website-remote-state"
}

variable "backend_dynamodb_table_name" {
  default = "alexstiff-website-remote-state"
}
