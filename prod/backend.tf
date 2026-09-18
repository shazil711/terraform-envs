terraform {
  backend "gcs" {
    bucket = "nopedope"
    prefix = "terraform/prod"
  }
}