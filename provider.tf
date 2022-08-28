terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.31.0"
    }
  }
}

# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ki-gcp-cloud"

    workspaces {
      name = "ki-google-cloud"
    }
  }
}

provider "google" {
  project = "playground-s-11-a5f9ab85"
  region  = "us-central1"
  zone    = "us-central1-a"
}
