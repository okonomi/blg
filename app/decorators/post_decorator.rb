module PostDecorator
  def published_date
    published_at&.strftime("%Y-%m-%d %H:%M").presence || ""
  end
end
