module Admin::AdminHelper

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html = content_tag :h3, title if title.present?
      html << (content_tag :div, :class => "in", &block)
    end
  end
  
  def link_to_new(model, url, text = "", html_options = {})
    text_reference = text.blank? ? t("new", :model => model.model_name.human) : text
    html_options.reverse_merge!(:class => "button right")
    link_to text_reference, url, html_options
  end
    
  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "green toolTip")
    html_options.reverse_merge!(:title => "Editar")
    link_to url, html_options do
      image_tag("icons/page_white_edit.png")
    end
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:title => "Excluir")
    html_options.reverse_merge!(:confirm => t("confirm"), :method => :delete, :class => "red toolTip")
    link_to url, html_options do
      image_tag("icons/delete.png")
    end
  end
 
  def textilize(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def gravatar_image_tag(email, html_options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=155&d=mm", html_options
  end

  def login_user(name, url="")
    name = "Anonymous Coward" unless name.present?
    url.present? ? link_to(name, url, :target => "_blank") : name
  end
  
  def group_by_date(records)
    new_records = []

    records.each do |record|
      key = record.created_at.strftime("%Y-%m-%d")
      record_group = new_records.collect{|records| records.last if records.first == key }.flatten.compact << record
      (new_records.delete_if {|i| i.first == key}) << [key, record_group]
    end

    new_records
  end
end
