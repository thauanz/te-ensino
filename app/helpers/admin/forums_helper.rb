module Admin::ForumsHelper
  def nested_messages(forums)
    forums.map do |message, sub_messages|
      render(message) + content_tag(:div, nested_messages(sub_messages), :class => "nested_messages")
    end.join.html_safe
  end
end
