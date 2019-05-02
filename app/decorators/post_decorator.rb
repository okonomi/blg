module PostDecorator
  def published_date
    published_at&.strftime('%Y-%m-%d').presence || ''
  end
end
