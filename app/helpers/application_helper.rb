module ApplicationHelper
  def error_messages_for(resource)
    render 'shared/error_messages', :resource => resource
  end

  def flash_messages
    flash.collect do |key, msg|
      content_tag(:p, msg, :id => key, :class => "flash-message")
    end.join.html_safe
  end

  def display_when_present(collection, &block)
    collection.present? ? capture(&block) : I18n.t("empty")
  end

  def translate_attribute(model, attribute)
    model.human_attribute_name(attribute)
  end
  alias_method :ta, :translate_attribute

  def favicon
    "<link rel=\"shortcut icon\" href=\"/images/favicon.png\" />".html_safe
  end
  
  def analytics(site_id)
    html = <<-ANALYTICS
    <script>
     var _gaq = [['_setAccount', '#{site_id}'], ['_trackPageview']];
     (function(d, t) {
      var g = d.createElement(t),
          s = d.getElementsByTagName(t)[0];
      g.async = true;
      g.src = '//www.google-analytics.com/ga.js';
      s.parentNode.insertBefore(g, s);
     })(document, 'script');
    </script>
    ANALYTICS
    
    html.html_safe
  end
  
  def sidebar
    render "layouts/sidebar" if user_signed_in?
  end
  
  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
      
    if collection.total_pages < 2
      case collection.size
      when 0; ""
      when 1; entry_name = t("#{entry_name}.one"); "Encontrado <b>1</b> #{entry_name}"
      else;   entry_name = t("#{entry_name}.other"); "Encontrado <b>#{collection.size}</b> #{entry_name}"
      end
    else
      entry_name = t("#{entry_name}.other")
      %{Resultados de #{entry_name.pluralize} <b>%d&nbsp;-&nbsp;%d</b> de <b>%d</b> no total} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end.html_safe
  end  
end
