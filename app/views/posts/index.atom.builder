atom_feed do |feed|
  feed.title(ENV.fetch('BLOG_TITLE'))
  feed.updated(@posts.first.updated_at) if @posts.length > 0

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.content.to_s, type: 'html')
    end
  end
end
