terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.31.0"
    }
  }
}

provider "google" {
  project = "playground-s-11-6e21b117"
  region = "us-central1"
  zone = "us-central1-a"
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "13.1.0"
}