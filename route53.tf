resource "aws_route53_zone" "main" {
  name = "${var.site_name}"
}

resource "aws_route53_record" "cloudfront-a" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.site_name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.s3_site.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.s3_site.hosted_zone_id}"
    evaluate_target_health = true
  }
}
