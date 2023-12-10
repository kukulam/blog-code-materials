resource "google_storage_bucket" "my_locked_versioned_bucket" {
  name          = "kukulam-gcs-locked-versioned-bucket"
  location      = "US"
  versioning {
    enabled = true
  }
  retention_policy {
    locked = true
    retention_period = 2592000 # 30 days
  }

  lifecycle_rule {
    condition {
      age  = 30
    }
    action {
      type = "Delete"
    }
  }
}