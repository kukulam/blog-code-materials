resource "google_storage_bucket" "my_locked_versioned_bucket" {
  name          = "kukulam-gcs-locked-versioned-bucket"
  location      = "US"
  versioning {
    enabled = true
  }
  retention_policy {
    is_locked = true
    retention_period = 7776000 # 90 days
  }

  lifecycle_rule {
    condition {
      age = 30
      days_since_noncurrent_time = 7
    }
    action {
      type = "Delete"
    }
  }
}