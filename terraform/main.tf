terraform {
  required_version = ">= 1.3"
  backend "gcs" {
    bucket = var.state_bucket
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
}

module "gke" {
  source = "./modules/gke"
  project_id = var.project_id
  region = var.region
  network = module.network.network_name
}
