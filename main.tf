terraform {
  cloud {
    organization = "mattiasu96"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
}

resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}