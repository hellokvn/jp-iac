resource "aws_s3_bucket" "s3" {
  bucket        = var.cdn_domain
  acl           = "public-read"
  policy        = file("./common/cdn/policy.json")
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  tags = {
    Name = "S3 Bucket for CDN"
  }
}
