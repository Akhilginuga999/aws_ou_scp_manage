
data  "aws_organizations_organization" "root" {}
resource "aws_organizations_organizational_unit" "Snowplow" {
  name      = "Snowplow"
  parent_id = data.aws_organizations_organization.root.roots[0].id
}

resource "aws_organizations_policy" "Admin_policy" {
name = "Admin_policy"
  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "*",
    "Resource": "*"
  }
}
CONTENT
}

resource "aws_organizations_policy_attachment" "unit" {
  policy_id = aws_organizations_policy.Admin_policy.id
  target_id = aws_organizations_organizational_unit.Snowplow.id
}