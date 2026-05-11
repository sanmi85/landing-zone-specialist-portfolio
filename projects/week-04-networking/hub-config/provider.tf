provider "aws" {
    region = "us-east-2"
    profile = "default"
    
}


terraform {
  backend "s3" {
    bucket = "sanmi-tf-state-storage"
    key    = "week-04/network-hub/terraform.tfstate"
    region = "us-east-2"
  }
}