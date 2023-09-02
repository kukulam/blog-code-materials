resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-name"
}

resource "aws_s3_bucket_lifecycle_configuration" "example_bucket_lifecycle" {
  rule {
    id      = "expire-objects"
    status  = "Enabled"
    prefix  = ""

    expiration {
      days = 30
    }
  }
}