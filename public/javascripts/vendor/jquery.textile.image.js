// Simple plugin to convert images to valid textile markup
//=================
// HTML
// <div class="media">
//   <a href="full.jpg">
//     <img src="thumb.jpg"/>
//   </a>
// </div>
//=================
// JS
// $(".media").insertTextileImageTo("#post_body");

(function($) {

  jQuery.fn.insertTextileImageTo = function(destination) {

    $(this).find('a').live("click", function(){
      var imagePath = "!" + escape($(this).attr('href')).replace('%3F', '?') + "!";
      var currentText    = $(destination).val();

      $(destination).val(currentText + " " + imagePath);
      return false;
    });

    return this;
  };

})(jQuery);
