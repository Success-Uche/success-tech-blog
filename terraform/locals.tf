locals {
  # Unique origin ID for S3 bucket
  s3_origin_id = "${var.bucket_name}-origin"

  # Static website endpoint for the S3 bucket
  s3_domain_name = "${var.bucket_name}.s3-website-${var.region}.amazonaws.com"
}

