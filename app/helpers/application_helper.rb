module ApplicationHelper
  def link_to(text, path, options = {}, &block)
    icon = options.delete(:icon)
    text = content_tag(:i, " #{text}", class: icon) if icon
    super
  end
end
