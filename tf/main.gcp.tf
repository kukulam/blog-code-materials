#resource "google_storage_bucket" "my_versioned_bucket" {
#  name          = "kukulam-gcs-versioned-bucket"
#  location      = "US"
#  versioning {
#    enabled = true
#  }
#
#  lifecycle_rule {
#    condition {
#      age  = 30
#    }
#    action {
#      type = "Delete"
#    }
#  }
#}