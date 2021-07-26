terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.76.0"
    }
  }
}

module "compute-example" {
  source = "./compute-example/main.tf"
}
