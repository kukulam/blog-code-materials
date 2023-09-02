resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-name"
}

resource "aws_s3_bucket_lifecycle_configuration" "example_bucket_lifecycle" {
  bucket = aws_s3_bucket.example_bucket.id
  rule {
    id      = "expire-objects"
    status  = "Enabled"

    expiration {
      days = 30
    }
  }
}