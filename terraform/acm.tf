resource "aws_acm_certificate" "acm_certificate" {
  provider = aws.secondary
  domain_name       = "example.com"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}