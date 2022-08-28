resource "google_compute_network" "ki-network" {
    name = "ki-network"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "ki-sub" {
  name = "ki-sub"
  network = google_compute_network.ki-network.id
  ip_cidr_range = "10.130.0.0/28"
  region = "us-central1"

}

resource "google_compute_firewall" "ki-fire" {
  name = "ki-fire"
  network = google_compute_network.ki-network.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports = ["22", "80"]
  }
  source_ranges =   ["0.0.0.0/0"]
}
