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

