resource "aws_route53_zone" "main" {
  name = "${var.site_name}"
}

resource "aws_route53_record" "cloudfront-a" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.site_name}"
  type    = "A"

  records = "${var.github_pages_ips}"
  zone_id = "${aws_route53_zone.main.zone_id}"
  ttl     = 60
}
