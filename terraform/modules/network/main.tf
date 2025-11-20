variable "project_id" {}
variable "region" {}

resource "google_compute_network" "vpc" {
  name = "hackathon-vpc"
  auto_create_subnetworks = false
  project = var.project_id
}

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  region        = var.region
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = "10.0.0.0/24"
  project = var.project_id
}

output "network_name" {
  value = google_compute_network.vpc.name
}
