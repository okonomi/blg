module PostDecorator
  def posted_date
    posted_at&.strftime('%Y-%m-%d')
  end
end
