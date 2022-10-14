module "dtpl-core-customer-profile-intg" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "sre+dtpl-core-customer-profile-intg@flutterint.com"
    AccountName               = "dtpl-core-customer-profile-intg"
    ManagedOrganizationalUnit = "DTPL (ou-t7v1-di0eztm2)"
    SSOUserEmail              = "sre+dtpl-core-customer-profile-intg@flutterint.com"
    SSOUserFirstName          = "DTPL-Core-Customer"
    SSOUserLastName           = "Profile-intg"
  }

  account_tags = {
    "OwnerName"   = "Kaloyan Kosev"
    "OwnerEmail"  = "kaloyan_kosev@pokerstarsint.com"
    "Division"    = "ENT"
    "Environment" = "intg"
    "CostCenter"  = "80716"
    "Project"     = "DTPL"
    "JiraRequest" = "CCOE-539"

    "SSOAA:tsg_aws_dtpl_platform_services_admins" = "AWSReadOnlyAccess"
    "SSOAA:tsg_aws_DTPL_DevOps"                   = "AWSReadOnlyAccess"
    "SSOAA:tsg_aws_dtpl_Data_Tech_Engineering"    = "AWSReadOnlyAccess"
    "SSOAA:tsg_aws_DTPL_Architects"               = "AWSReadOnlyAccess"
  }

  change_management_parameters = {
    change_requested_by = "Alexander Tsankov"
    change_reason       = "CCOE-539"
  }

  custom_fields = {
    group1 = "testgroup1"
    group2 = "testgroup2"
  }

  account_customizations_name = "dtpl-nonprod"
}
