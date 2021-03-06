terraform {
  backend "remote" {
    # The name of your Terraform Cloud Organization.
    organization = "jmcalalang-tf-organization"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "gcp-demo-nginx-consul"
    }
  }
}

# provider
provider google {
  project = var.gcpProjectId
  region  = var.gcpRegion
  zone    = var.gcpZone
}

# project
resource random_pet buildSuffix {
  keepers = {
    prefix = var.projectPrefix
  }
  length    = 2
  separator = "-"
}