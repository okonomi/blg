# frozen_string_literal: true

namespace :oneshot do
  desc ""
  task "20221009_export_blog_post": :environment do
    require "erb"
    require "fileutils"
    require "reverse_markdown"

    FileUtils.mkdir_p Rails.root.join("tmp/transfer/posts")

    front_matter = ERB.new(<<~ERB, trim_mode: "<>")
      layout: "../../layouts/BlogPost.astro"
      title: "<%= (post.title.presence || "no title").gsub('"', '\\"') %>"
      pubDate: "<%= post.published_date %>"
      <% if post.tags.count > 0 %>
      tags:
      <% post.tags.each do |tag| %>
        - <%= tag.name %>
      <% end %>
      <% end %>
    ERB

    Post.includes(:tags, :rich_text_content).published.find_each do |post|
      post = ActiveDecorator::Decorator.instance.decorate(post)

      # 記事本文取得
      content = post.content.to_s

      # markdownに変換
      md = ReverseMarkdown.convert(content, github_flavored: true)

      md.gsub!(/  $/, "")
      md.gsub!(/\n{3,}/m, "\n\n")
      md.gsub!(/\n+$/m, "\n")

      # .mdに保存
      path = Rails.root.join("tmp/transfer/posts/#{post.uid}.md")
      File.open(path, "w") do |f|
        f.write(<<~"FRONTMATTER")
          ---
          #{front_matter.result_with_hash({ post: post }).chomp("")}
          ---
        FRONTMATTER

        f.write(md)
      end
    end
  end
end
