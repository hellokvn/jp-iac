# --- root/backend.tf

terraform {
  backend "remote" {
    organization = "kvnvo-terraform"

    workspaces {
      name = "jp-iac"
    }
  }
}
