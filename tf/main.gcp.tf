resource "google_storage_bucket" "my_bucket" {
  name          = "my-gcs-bucket"
  location      = "US"

  lifecycle_rule {
    condition {
      age  = 7
      matches_prefix = ["temp/"]
    }
    action {
      type = "Delete"
    }
  }
}