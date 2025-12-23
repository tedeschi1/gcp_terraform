resource "google_compute_network" "vpc1_uscentral1" {
  name = "vpc1-uscentral1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc1_uscentral1_subnet1" {
  name = "vpc1-uscentral1-subnet1"
  ip_cidr_range = "10.100.1.0/24"
  network = google_compute_network.vpc1_uscentral1.id
  region = "us-central1"
}

resource "google_compute_subnetwork" "vpc1_uscentral1_subnet2" {
  name = "vpc1-uscentral1-subnet2"
  ip_cidr_range = "10.100.2.0/24"
  network = google_compute_network.vpc1_uscentral1.id
  region = "us-central1"
}
