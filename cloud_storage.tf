resource "google_storage_bucket" "ki-storage" {
  name     = "ki-storage-2022"
  location = "US"

}

resource "google_storage_bucket_object" "random_file" {
  name   = "file.sh"
  source = "file.sh"
  bucket = google_storage_bucket.ki-storage.id
}
