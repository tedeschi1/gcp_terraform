resource "google_compute_network" "vpc1_east1" {
  name = "vpc1-east1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc1_subnet1" {
  name = "vpc1-subnet1"
  ip_cidr_range = "10.0.1.0/24"
  network = google_compute_network.vpc1_east1.id
  region = "us-east1"
}

resource "google_compute_subnetwork" "vpc1_subnet2" {
  name = "vpc1-subnet2"
  ip_cidr_range = "10.0.2.0/24"
  network = google_compute_network.vpc1_east1.id
  region = "us-east1"
}
