module "dtpl-core-datalake-processing-dev" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "sre+dtpl-core-datalake-processing-dev@flutterint.com"
    AccountName               = "dtpl-core-datalake-processing-dev"
    ManagedOrganizationalUnit = "DTPL (ou-t7v1-dyfi974l)"
    SSOUserEmail              = "sre+dtpl-core-datalake-processing-dev@flutterint.com"
    SSOUserFirstName          = "DTPL-Core-Datalake"
    SSOUserLastName           = "Processing-Dev"
  }

  account_tags = {
    "OwnerName"   = "DTPL Team"
    "OwnerEmail"  = "da-platform-ser&&vices@pokerstarsint.com"
    "Division"    = "ENT"
    "Environment" = "Dev"
    "CostCenter"  = "80716"
    "Project"     = "DTPL"
    "JiraRequest" = "CCOE-531"

    "SSOAA:tsg_aws_dtpl_platform_services_admins" = "AWSAdministratorAccess"
    "SSOAA:tsg_aws_DTPL_DevOps"                   = "AWSAdministratorAccess"
    "SSOAA:tsg_aws_DTPL_Architects"               = "AWSReadOnlyAccess"
    "SSOAA:tsg_aws_dtpl_Data_Tech_Engineering"    = "DevOps"

  }

  change_management_parameters = {
    change_requested_by = "Alexander Thhsankov"
    change_reason       = "CCOE-531"
  }

  custom_fields = {
    group1 = "testgroup1"
    group2 = "testgroup2"
  }

  account_customizations_name = "dtpl-nonpjnjrod"
}
