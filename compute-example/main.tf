terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.76.0"
    }
  }
}

provider "google" {
  region = var.gcp_region
  zone   = var.gcp_zone
}

resource "google_compute_instance" "vm1" {
  name         = "my-vm-1"
  project = var.gcp_project_id
  machine_type = "default"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "my-new-network"
  }

  allow_stopping_for_update = true
}

resource "google_compute_instance" "vm2" {
  name         = "my-vm-2"
  machine_type = "default"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "my-new-network"
  }

  allow_stopping_for_update = true
}

resource "google_compute_network" "google_network" {
  name                    = "my-new-network"
  auto_create_subnetworks = true
  mtu                     = 1460
}
