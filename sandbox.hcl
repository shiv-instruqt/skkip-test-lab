resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "google_project" "lease" {
  regions = ["europe-west1"]
  services = [
    "compute.googleapis.com",
    "pubsub.googleapis.com",
    "run.googleapis.com",
    "cloudfunctions.googleapis.com",
    "containerregistry.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]

  user "learner" {
    roles = ["roles/editor", "roles/iam.securityReviewer", "roles/browser"]
  }

  service_account "learner" {
    roles = ["roles/editor", "roles/iam.securityReviewer", "roles/browser"]
  }

  service_account "grader" {
    roles = ["roles/editor", "roles/iam.securityReviewer", "roles/browser"]
  }
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu:22.04"
  }

  network {
    id = resource.network.main.meta.id
  }

  environment = {
    GOOGLE_PROJECT = resource.google_project.lease.project_id
  }

  resources {
    cpu    = 1000
    memory = 256
  }
}
