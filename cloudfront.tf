resource "aws_acm_certificate" "cert" {
  provider    = "aws.us-east-1"
  domain_name = "${var.site_name}"

  subject_alternative_names = [
    "*.${var.site_name}",
  ]

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudfront_distribution" "s3_site" {
  origin {
    domain_name = "${aws_s3_bucket.site.bucket_regional_domain_name}"
    origin_id   = "S3-${var.site_name}"
  }

  enabled = true

  aliases             = ["${var.site_name}"]
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.site_name}"
    compress         = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.cert.arn}"
    ssl_support_method  = "sni-only"
  }
}
