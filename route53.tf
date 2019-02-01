resource "aws_route53_zone" "alexstiff-com" {
  name = "alexstiff.com"
}

resource "aws_route53_record" "alexstiff-a-record" {
  zone_id = "${aws_route53_zone.alexstiff-com.zone_id}"
  name    = "alexstiff.com"
  type    = "A"

  alias {
    name                   = "s3-website-eu-west-1.amazonaws.com" # Change this to s3 endpoint
    zone_id                = "Z1BKCTXD74EZPE"                     # Get zone id
    evaluate_target_health = true
  }
}
