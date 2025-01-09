output "s3_bucket_name" {
  description = "The unique identifier (name) of the S3 bucket"
  value       = aws_s3_bucket.my-blog.id
}

output "s3_bucket_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = aws_s3_bucket.my-blog.bucket_regional_domain_name
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution for content delivery"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_url" {
  description = "The public URL for the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "deployed_region" {
  description = "The AWS region where resources are deployed"
  value       = var.region
}

output "aws_account_id" {
  description = "The AWS account ID"
  value       = data.aws_caller_identity.current.account_id
}
