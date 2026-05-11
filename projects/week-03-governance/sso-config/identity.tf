data "aws_ssoadmin_instances" "main" {}

data "aws_identitystore_user" "sanmi" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = "sanmi85"
    }
  }
}

resource "aws_ssoadmin_permission_set" "specialist" {
  name             = "LandingZoneSpecialist"
  description      = "Standard read-only access for Landing Zone audit."
  instance_arn     = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  session_duration = "PT4H"
}

resource "aws_ssoadmin_managed_policy_attachment" "readonly" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.specialist.arn
}

resource "aws_ssoadmin_account_assignment" "sandbox_access" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.specialist.arn

  principal_id   = data.aws_identitystore_user.sanmi.user_id
  principal_type = "USER"

  target_id   = "643537035424"
  target_type = "AWS_ACCOUNT"
}