resource "google_compute_instance" "ki-vm" {
    count = 2
  name = "ki-vm-${count.index}"
  machine_type = "n1-standard-1"
  network_interface {
    network = google_compute_network.ki-network.id
    subnetwork = google_compute_subnetwork.ki-sub.id
    access_config {
      
    }
  }
  metadata_startup_script = file("file.sh")
  
  service_account {
    email = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.id
    }
  }
}

resource "google_compute_instance" "ki-default-vm" {
  name = "ki-default-vm"
  machine_type = "n1-standard-1"
  network_interface {
    network = "default"
    access_config {
          }
  }
  metadata_startup_script = file("file.sh")
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.id
    }
  }
}

data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

data "google_compute_default_service_account" "default"{

}

/*
variable "metascript" {
  default = "sudo apt update \n sudo apt install apache2 -y \n sudo bash -c 'echo 'Hi Ki, I am from GOOGLE!!!' >> /var/www/html/index.html' \n /etc/init.d/apache2 restart \n"
}
*/