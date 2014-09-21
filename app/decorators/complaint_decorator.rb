class ComplaintDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def link
    h.link_to "#{url}", url
  end

  def censored_content
    array = Censorship.all.map(&:word).join('|')

    regex = /#{array}/i

    content.gsub(regex, h.image_tag('censored.gif')).html_safe
  end
end
