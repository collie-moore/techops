resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = false
  public_access_prevention    = "inherit"
  storage_class = "STANDARD"

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}