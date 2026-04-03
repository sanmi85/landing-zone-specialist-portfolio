# 1. Fetch the Organization Root ID
data "aws_organizations_organization" "org" {}

# 2. Fetch the "Workloads" OU created in the previous week
# So no need to redeclare the resource
data "aws_organizations_organizational_unit" "workloads" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
  name      = "Workloads"
}

# 3. Update the attachment block to use the DATA source
resource "aws_organizations_policy_attachment" "workloads_attach" {
  policy_id = aws_organizations_policy.region_lock.id
  
 
  target_id = data.aws_organizations_organizational_unit.workloads.id
}





resource "aws_organizations_policy" "region_lock" {
  name        = "RegionLockPolicy"
  description = "Deny all regions except us-east-2"
  content     = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid      = "DenyAllOutsideUSEast2"
      Effect   = "Deny"
      NotAction = ["iam:*", "organizations:*", "route53:*"]
      Resource = "*"
      Condition = {
        StringNotEquals = { "aws:RequestedRegion": ["us-east-2"] }
      }
    }]
  })
}

