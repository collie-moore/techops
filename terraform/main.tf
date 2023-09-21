terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.83.0"
    }
  }
}

provider "google" {
  project = "buupassdev"
  region  = "us-central1"
  zone    = "us-central1-c"
}

