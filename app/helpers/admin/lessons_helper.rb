module Admin::LessonsHelper

  def link_to_add_asset(name, f)  
    
    link_to_function(image_tag("icons/add.png"), "add_assets(this)", 
                      :class => "toolTip", :title => "#{name}")
 
  end
end
