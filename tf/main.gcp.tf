resource "google_storage_bucket" "my_locked_bucket" {
  name          = "kukulam-gcs-locked-bucket"
  location      = "US"

  retention_policy {
    is_locked = true
    retention_period = 7776000 # 90 days
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}