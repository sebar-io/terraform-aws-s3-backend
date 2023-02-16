provider "aws" {
  region = "us-east-1"
}

# stage backend
module "backend-stage" {
  source = "./modules/backend"
  env = "stage"
  organization = var.organization
}

# prod backend
module "backend-prod" {
  source = "./modules/backend"
  env = "prod"
  organization = var.organization
}