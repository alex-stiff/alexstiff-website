terraform {
  backend "s3" {
    bucket         = "alexstiff-website-remote-state"
    key            = "terraform.tfstate"
    dynamodb_table = "alexstiff-website-remote-state"
    region         = "eu-west-2"
  }
}
