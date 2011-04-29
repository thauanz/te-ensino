function remove_fields(link) {  
    $(link).prev("input[type=hidden]").val("1");  
    $(link).closest(".fields").hide();  
}  

function add_assets(link) {
  $("#anexos table").append($("tr"));
  $("tr").closest().hide();
}

$(function(){
  $(".toolTip").tipTip({
    defaultPosition: "top",
    maxWidth: "auto", 
    edgeOffset: 10,
    fadeIn: 50
    });
});

$(function() {
	$( ".datepicker" ).datepicker();
});

$(function() {
    $.mask.definitions['~'] = "[+-]";
    $("#user_contact").mask("(99)9999-9999");
    $("#user_cellfone").mask("(99)9999-9999");
    
    $("#date").mask("99/99/9999",{completed:function(){alert("completed!");}});
    $("#tin").mask("99-9999999");
    $("#ssn").mask("999-99-9999");
    $("#product").mask("a*-999-a999", { placeholder: " " });
    $("#eyescript").mask("~9.99 ~9.99 999");
    $("#po").mask("PO: aaa-999-***");
    $("#pct").mask("99%");

    $("input").blur(function() {
        $("#info").html("Unmasked value: " + $(this).mask());
    }).dblclick(function() {
        $(this).unmask();
    });
});

/* Brazilian initialisation for the jQuery UI date picker plugin. */
/* Written by Leonildo Costa Silva (leocsilva@gmail.com). */
jQuery(function($){
	$.datepicker.regional['pt-BR'] = {
		closeText: 'Fechar',
		prevText: '&#x3c;Anterior',
		nextText: 'Pr&oacute;ximo&#x3e;',
		currentText: 'Hoje',
		monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
		'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
		'Jul','Ago','Set','Out','Nov','Dez'],
		dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','S&aacute;bado'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S&aacute;b'],
		dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','S&aacute;b'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);
});
