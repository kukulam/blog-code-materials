resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "kukulam-versioned-bucket-name"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.versioned_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioned_bucket_lifecycle" {
  depends_on = [aws_s3_bucket_versioning.versioning]

  bucket = aws_s3_bucket.versioned_bucket.id

  rule {
    id      = "expire-objects-current-version"
    status  = "Enabled"

    expiration {
      days = 30
    }
  }

  rule {
    id      = "expire-objects-noncurrent-version"
    status  = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 7
    }
  }
}
