variable "project_id" {}
variable "region" {}
variable "network" {}

resource "google_container_cluster" "primary" {
  name     = "hackathon-gke"
  location = var.region
  network  = var.network
  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-pool"
  cluster    = google_container_cluster.primary.name
  node_count = 2
  node_config {
    machine_type = "e2-medium"
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}
