resource "google_storage_bucket" "my_bucket" {
  name          = "my-gcs-bucket"
  location      = "US"
}

resource "google_storage_bucket_lifecycle_rule" "expire_rule" {
  count = 1

  action {
    type = "Delete"
  }

  condition {
    age = 30
  }

  depends_on = [google_storage_bucket.my_bucket]
}