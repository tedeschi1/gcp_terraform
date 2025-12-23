# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }

resource "google_compute_instance" "centralus" {
  name         = "centralus-compute-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["centralus", "allow-ssh"]

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
    network = google_compute_network.vpc1_uscentral1.name
    subnetwork = google_compute_subnetwork.vpc1_uscentral1_subnet1.name

    access_config {
      // Ephemeral public IP
    }
  }

  depends_on = [ google_compute_subnetwork.vpc1_uscentral1_subnet1 ]
}
