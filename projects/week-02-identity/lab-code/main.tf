# 1. The Provider Block: 
provider "aws" {
  region = "us-east-2" # Target the region Sanmi audited in Week 1
}

terraform {
  backend "s3" {
    bucket = "sanmi-tf-state-storage"
    key    = "week-02/identity/terraform.tfstate"
    region = "us-east-2"
  }
}


# 3. Data Source: Fetching the current Org info
data "aws_organizations_organization" "org" {}

output "org_id" {
  value = data.aws_organizations_organization.org.id
}



# 2. Create the Security OU
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

# 3. Create the Workloads OU
resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}
