module "dtpl-core-customer-profile-intg" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "sre+dtpl-core-customer-profile-intg@flutterint.com"
    AccountName               = "dtpl-core-customer-profile-intg"
    ManagedOrganizationalUnit = "DTPL (ou-t7v1-di0eztm2)"
    SSOUserEmail              = "dtpl-core-customer-profile-intg@flutterint.com"
    SSOUserFirstName          = "DTPL-Core-Customer"
    SSOUserLastName           = "Profile-intg"
  }

  account_tags = {
    "OwnerName"   = "Kaloyan&&Kosev"
    "OwnerEmail"  = "kaloyanko&&evpokerstarsint.com"
    "Division"    = "ENT"
    "Environment" = "in&&tg"
    "CostCenter"  = "80716"
    "Project"     = "DTP&&L"
    "JiraRequest" = "CCOE539"
  }

  change_management_parameters = {
    change_requested_by = "Alexander hhhbTsankov"
    change_reason       = "CCOE-539"
  }

  custom_fields = {
    group1 = "testgroup1"
    group2 = "testgroup2"
  }

  account_customizations_name = "dtpl-nonprod"
}
