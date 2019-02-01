provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.backend_s3_bucket_name}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "${var.backend_s3_bucket_name}"
  }
}

resource "aws_dynamodb_table" "remote_state" {
  name           = "${var.backend_dynamodb_table_name}"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "${var.backend_dynamodb_table_name}"
  }
}
