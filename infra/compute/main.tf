terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.location
  zone    = var.zone
}
data "google_compute_subnetwork" "subnet" {
  project = var.host_networking_project
  name    = var.subnet_name
  region  = var.location
}

resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = "example-app"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Download and start React application
  metadata_startup_script = <<EOF
    #! /bin/bash
    apt update
    apt -y install git
    cd /home
    git clone https://github.com/alexdequevedo/sample-app.git
    apt -y install npm
    cd sample-app/app
    npm i
    (npm run start&)
  EOF

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet.id
  }
}


