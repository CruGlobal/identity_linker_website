module ApplicationHelper
  def spinner(options = {})
    id = options[:extra] ? "spinner_#{options[:extra]}" : 'spinner'
    style = options[:visible] ? '' : 'display:none'
    image_tag('spinner.gif', id: id, style: style, class: 'spinner')
  end
end
