provider "aws" {
  region = var.region
}

provider "google" {
  project = "kukulam-blog"
  region  = "us-central1"
}