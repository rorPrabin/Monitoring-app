ready = ->
  $("#company_allow_email_regex_true").click ->
    $("#show_hide_email_format").slideDown "slow"

  $("#company_allow_email_regex_false").click ->
    $("#show_hide_email_format").slideUp "slow"

$(document).ready(ready)
$(document).on('page:load', ready)