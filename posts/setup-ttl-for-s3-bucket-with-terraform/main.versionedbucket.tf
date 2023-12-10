resource "google_storage_bucket" "my_versioned_bucket" {
  name          = "my-versioned-gcs-bucket"
  location      = "US"
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_lifecycle_rule" "expire_rule" {
  count = 1

  action {
    type = "Delete"
  }

  condition {
    age = 30
  }

  depends_on = [google_storage_bucket.my_versioned_bucket]
}