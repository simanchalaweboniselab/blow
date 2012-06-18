//= require active_admin/base
//= require jquery.tokeninput
$(function() { //token input
    $("#tag_tokens").tokenInput("/tags.json", {
        crossDomain: false,
        theme: "facebook"
    });
});
$(function(){
    $("#active").live("click",function(){
        var url = "/admin_actives";
        var active = $(this).val()
        var id= $(this).closest('tr').children('td.id').text();
        $.get(url,{"active":active, "id":id});
    });
});