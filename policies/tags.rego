package main

import future.keywords.in

account_blocks[module_label] {
  some module_label, i  
  module := input.module[module_label][i]
  startswith(
    module.source,
    "./modules/aft-account-request"
  )
}



deny[reason] {
some account in input.module[_]
  x := account.control_tower_parameters.AccountEmail
  not  startswith(x, "sre+")
  reason := "The account root email not starting with sre. This to set email alias so all root emails and credentials are managed by CCoE. Format must be sre+<ACCOUNTNAME>@flutterint.com."
}

# Setting on warning for the time.
# This because old accounts does not comply, but we still want to add new accounts with flutterint.com

deny[msg] {
  some accountEmail in input.module[_]
  x := accountEmail.control_tower_parameters.AccountEmail
  not endswith(x, "flutterint.com")
  msg := "Root email does not end with @flutterint.com. Currently this is not a binding error. As we are working to transition new accounts to @flutterint.com this can be ignored."
}


deny[reason] {
  some account in input.module[_]
  not account.change_management_parameters.change_requested_by
  reason := "The change_management_parameters.change_requested_by tag is not set. We want to capture reason for account request and who initiated the request."

}

deny[reason] {
  some account in input.module[_]
  not account.account_tags.OwnerName
  reason := "The OwnerName tag is not set for the account."
}
#deny[reason] {
  #some account in input.module[_]
  #some key, val in account.account_tags
  #not regex.match("^[A-Za-z0-9 _.:/=+@-`]+$", val)
  #reason := sprintf("not a vaild tag name")
#}

deny[reason] {
  some account in input.module[_]
       tags := account.account_tags[_] 
       r := "[^A-Za-z0-9 _.:=+@-`]"
      not regex.match(r, tags)
  reason := "not a vaild tag name"
}