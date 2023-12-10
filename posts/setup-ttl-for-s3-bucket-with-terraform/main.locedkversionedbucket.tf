resource "aws_s3_bucket" "locked_versioned_bucket" {
  bucket = "kukulam-locked-versioned-bucket-name"

  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "locking" {
  bucket = aws_s3_bucket.locked_versioned_bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 90
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.locked_versioned_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioned_bucket_lifecycle" {
  depends_on = [aws_s3_bucket_versioning.versioning]

  bucket = aws_s3_bucket.locked_versioned_bucket.id

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
