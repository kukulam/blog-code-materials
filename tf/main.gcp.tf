resource "google_storage_bucket" "my_bucket" {
  name          = "my-gcs-bucket"
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