//= require active_admin/base
//= require jquery.tokeninput
$(function() { //token input
    $("#tag_tokens").tokenInput("/tags.json", {
        crossDomain: false,
        theme: "facebook"
    });
});