resource "google_storage_bucket" "my_locked_versioned_bucket" {
  name          = "kukulam-gcs-locked-versioned-bucket"
  location      = "US"
  versioning {
    enabled = true
  }
  retention_policy {
    locked = true
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

  depends_on = [google_storage_bucket.my_locked_versioned_bucket]
}