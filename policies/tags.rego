package main

import future.keywords.in

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