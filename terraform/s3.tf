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

# Bucket policy remains the same
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.my-blog.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my-blog.arn}/*"
      }
    ]
  })
}