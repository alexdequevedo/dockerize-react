terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63.0"
    }
  }
}

provider "google" {
  project = var.host_networking_project
  region  = var.location
  zone    = var.zone
}
data "google_compute_subnetwork" "subnet" {
  project = var.host_networking_project
  name    = var.subnet_name
  region  = var.location
}

resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = data.google_compute_subnetwork.subnet.network
  priority      = 1000
  source_ranges = ["35.235.240.0/20"] # Identity Aware Proxy CIDR
  target_tags   = ["ssh"]
}
