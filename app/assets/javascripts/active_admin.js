//= require active_admin/base
//= require jquery.tokeninput
$(function() {
  $("#tag_tokens").tokenInput("/tags.json", {
    crossDomain: false,
    theme: "facebook"
  });
});


