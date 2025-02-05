# Main bucket resource
resource "aws_s3_bucket" "my-blog" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = terraform.workspace
    Project     = "Blog Hosting"
  }
}

# Website configuration (separated as recommended)
resource "aws_s3_bucket_website_configuration" "my-blog" {
  bucket = aws_s3_bucket.my-blog.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}