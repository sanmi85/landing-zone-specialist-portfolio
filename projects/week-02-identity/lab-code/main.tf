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


# Level 0: Fetch the Organization Root (Top of the tree)
data "aws_organizations_organization" "org" {}

output "org_id" {
  value = data.aws_organizations_organization.org.id
}


# Level 1: Create the Parent OUs
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

# Level 2: Create Nested Child OUs
# Notice: The parent_id points to the Workloads OU, NOT the Root.

resource "aws_organizations_organizational_unit" "development" {
  name      = "Development"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "production" {
  name      = "Production"
  parent_id = aws_organizations_organizational_unit.workloads.id
}