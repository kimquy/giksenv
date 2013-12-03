module ApplicationHelper
  def markdown(text)
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    m.render(text).html_safe
  end
end
