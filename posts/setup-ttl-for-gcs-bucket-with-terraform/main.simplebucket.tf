resource "google_storage_bucket" "my_bucket" {
  name          = "kukulam-gcs-simple-bucket"
  location      = "US"

  lifecycle_rule {
    condition {
      age  = 30
    }
    action {
      type = "Delete"
    }
  }
}