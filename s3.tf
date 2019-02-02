resource "aws_s3_bucket" "site" {
  bucket = "${var.site_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}
