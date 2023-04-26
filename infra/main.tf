data "google_compute_subnetwork" "subnet" {
  project = var.project_id
  name    = var.subnet_name
  region  = var.location
}

resource "google_compute_instance" "default" {
  name         = "example-app"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Download and start React Application
  metadata_startup_script = <<EOF
    #! /bin/bash
    apt -y install git
    apt -y install npm
    mkdir -p /home/sample-app
    cd /home/sample-app
    git clone https://github.com/alexdequevedo/sample-app.git
    cd sample-app/app
    npm i
    (npm run start&)
  EOF

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet.id
  }
}

resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = data.google_compute_subnetwork.subnet.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
