resource "google_compute_instance" "east1" {
  name         = "east1-compute-instance"
  machine_type = "n2-standard-2"
  zone         = "us-east1-b"

  tags = ["east1", "allow-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc1_east1.name
    subnetwork = google_compute_subnetwork.vpc1_subnet1.name

    access_config {
      // Ephemeral public IP
    }
  }

  depends_on = [ google_compute_subnetwork.vpc1_subnet1 ]
}
