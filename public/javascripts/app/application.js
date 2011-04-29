// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//function para o campo select da tela de assets.
courseSelect = function() {
  $("#courses").live("change", function(){
    if ($("#courses").val() > 0) {
      $.get("/app/assets/"+$(this).val()+"/users.js");
      $("#ver").show();
    }
    else
    {
      $("#ver").hide();
    }
    return false;
  });
};

$(function() {  
  if ($("#alerts").length > 0) {  
    setTimeout(updateAlerts, 10000);  
  }  
});  
  
function updateAlerts() {  
  var alert_id = $('#alert-id').attr('data-id');
  if ($('.alert').length > 0) {
    var after = $('.alert:first').attr('data-time');
  }
  else {
    var after = 0;
  }
  $.getScript("/alerts.js?after="+after); 
  setTimeout(updateAlerts, 10000);

};
