provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# Cloudfront needs ACM in us-east-1 region
provider "aws" {
  alias      = "us-east-1"
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}
