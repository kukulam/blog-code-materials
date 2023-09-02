resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "kukulam-versioned-bucket-name"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioned_bucket_lifecycle" {
  bucket = aws_s3_bucket.versioned_bucket.id

  rule {
    id      = "expire-objects"
    status  = "Enabled"

    expiration {
      days = 30
    }

    noncurrent_version_expiration {
      days = 30
    }
  }
}