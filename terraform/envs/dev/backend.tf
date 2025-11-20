terraform {
  backend "gcs" {
    bucket = "<YOUR_STATE_BUCKET>"
    prefix = "terraform/dev"
  }
}
