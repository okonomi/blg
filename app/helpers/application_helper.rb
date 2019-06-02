module ApplicationHelper
  def page_title(title)
    [title, ENV.fetch("BLOG_TITLE")].reject(&:blank?).join(" | ")
  end
end
