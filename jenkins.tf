provider "google" {
  project     = "cts01-shreyashree"
  region      = "europe-west2"
  zone        = "europe-west2-a"
}
resource "google_compute_instance" "default" {
  provider = google
  name = "default"
  machine_type = "e2-micro"
  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
    }
  }
  # Some changes require full VM restarts
  # consider disabling this flag in production
  #   depending on your needs
  allow_stopping_for_update = true
}
